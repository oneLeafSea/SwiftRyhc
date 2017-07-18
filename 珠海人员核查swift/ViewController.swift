//
//  ViewController.swift
//  珠海人员核查swift
//
//  Created by 冯学仕 on 17/6/15.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit
import FontAwesomeKit
import MBProgressHUD


class ViewController: UIViewController , UITableViewDelegate ,  UITableViewDataSource , InputTextViewDelegate , StateChangeDelegate{
    
    let keyboardHeight :Float = 48
    let identifier = "Cell"
    
    let eventhandler = EventHandle.shareInstance
    let filterManager = FilterManager.shareInstance
    let stateManager = StateManager.shareInstance
    let queueManager = QueueManager.shareInstance
    let requestParam = RequestParam()
    
    var wholeArray : [RyItem] = [RyItem]()
    lazy var listView :UITableView = {
         var tableView = UITableView.init(frame: CGRect.zero, style: UITableViewStyle.plain)
             tableView.backgroundColor = UIColor.uiColor(value: "#aaeaeaea")
             tableView.register(RyhcCell.self, forCellReuseIdentifier: "Cell")
             tableView.estimatedRowHeight = 500
             tableView.rowHeight = UITableViewAutomaticDimension
             tableView.delegate   = self
             tableView.dataSource = self
             tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        return tableView
    }()
    lazy var centerLabel:UILabel = {
       var label = UILabel.init(frame: CGRect.zero)
           label.font = UIFont.systemFont(ofSize: 24)
           label.textColor = UIColor.uiColor(value: "#000000")
           label.textAlignment = NSTextAlignment.center
           return label
       
     }()
    lazy var warterMarkView : UIImageView = {
       var imageView = UIImageView.init(frame: CGRect.zero)
           imageView.backgroundColor = UIColor.clear
           imageView.alpha = 1
        let rotation  = -0.15 * M_PI
           imageView.transform = imageView.transform.rotated(by: CGFloat(rotation))
      return imageView
    }()
    lazy var inputField :InputFieldView = {
       let inputRect = CGRect.init(x: 0, y: Constants.ScreenHeight - 48, width: Constants.ScreenWidth, height: 48)
       var inputView = InputFieldView.init(frame: inputRect)
           return inputView
    }()
/************************************************************************************************************/
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //设置水印
        setWatermark()
        //设置界面上的视图
        setViewElementFrame()
        self.centerLabel.text = "欢迎使用人员核查"
        self.view.addSubview(inputField)
        inputField.touchInWindow(view: listView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置默认界面数据
        self.title = ConstantNames.AppName
        //设置右侧version导航图标
        setRightNavItem()
        eventhandler.inputFieldDelegate = self
        stateManager.stateDelegate = self
        listView.register(RyhcCell.self, forCellReuseIdentifier: identifier)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        inputField.showInputField()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.view.removeFromSuperview()
    }
    
    
    
/*************************************************************************************************************/
    
    //tableView delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wholeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let ryCell : RyhcCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! RyhcCell
        let ryItem = wholeArray[indexPath.row]
            ryCell.configDataWith(data: ryItem)
        
        return ryCell
    }
    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 500
//    }
/*************************************************************************************************************/
    func onQueryWithTextString(text: String) {
        let ryItem = RyItem()
        DispatchQueue.global().async {
            //事务1
            let checkResult :Bool = self.filterManager.checkIdentifierWithNum(date: text)
            DispatchQueue.main.async {
                //主线程更新
                if (checkResult == true)
                {
                    self.requestParam.getIdentifier(id:text)
                    self.requestParam.getRequestParam()
                    let requestDictionary:[String :String] = self.requestParam.setDic()
                    let concurrentQueue = DispatchQueue.init(label: ConstantNames.DataGetten, attributes: DispatchQueue.Attributes.concurrent)
                    ryItem.identifier = text
                    ryItem.state = QueryState.Query_Intime
                    self.wholeArray.append(ryItem)
                    self.stateManager.notifWindowToDealWithIn_QueryAction()
                    //准备请求数据
                    let itemWork = DispatchWorkItem.init(qos: DispatchQoS.default, flags: DispatchWorkItemFlags.barrier, block: {
                        UrlConnect.post(urlString: UrlContants.RYCONNECT_URL, params:requestDictionary , callback: { (data, error) in
                            if error == nil
                            {
                                ryItem.state = QueryState.Query_success
                                ryItem.parseData(data:data!)
                                Log.logWithUsefulStringParamters(headString: "我执行完了", bodyString: ryItem.state.rawValue)
                                
                            }
                            else
                            {
                                ryItem.state = QueryState.Query_false
                            }
                            
                            DispatchQueue.main.async {
                                self.stateManager.doQueryWithItemCurrentState(state: ryItem.state)
                            }
                        })
                    })
                    
                    concurrentQueue.async(execute: itemWork)
                }
                else
                {
                    let hud = MBProgressHUD.init(view: self.view)
                        hud?.labelText = "身份证校验出错"
                        hud?.labelFont = UIFont.systemFont(ofSize: 16)
                        hud?.mode = MBProgressHUDMode.text
                        hud?.margin = 9
                        hud?.show(true)
                        hud?.hide(true, afterDelay: 1.0)
                    self.view.addSubview(hud!)
                }
            }
        }
        
        
    }
    
    func onKeyBoardWillShow(noti:NSNotification) {
        rebuildTableViewFrameWithKeyBoardWillShowNotification(noti:noti)
    }
    
    func onKeyBoardWillHide(noti:NSNotification)
   {
    recoverTableViewFrameWithKeyBoardWillHideNotification(noti:noti)
   }
    
    //1.keyboardWillshow
    func rebuildTableViewFrameWithKeyBoardWillShowNotification(noti:NSNotification)
    {
        let stateH = UIApplication.shared.statusBarFrame.size.height
        let dic :NSDictionary = NSDictionary.init(dictionary: noti.userInfo!)
        let nsValue = dic.object(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
        listView.frame = CGRect.init(x: -8, y: Int(stateH - nsValue.cgRectValue.size.height), width: Int(listView.frame.size.width), height: Int(listView.frame.size.height + 50))

    }
    
    //2.keyboardWillHide
    func recoverTableViewFrameWithKeyBoardWillHideNotification(noti:NSNotification)
    {
        let state_height = UIApplication.shared.statusBarFrame.size.height
        let navi_height  = self.navigationController?.navigationBar.frame.size.height
        let whole_Height = state_height + navi_height!
        listView.frame = CGRect.init(x: -8, y: whole_Height, width: listView.frame.size.width, height: Constants.ScreenHeight - whole_Height - 48)
    }
 /*******************************************************************************************************/
    func onInQuery() {
        //开始更新(查询身份证号添加到人员项当中，弹出转圈图标，进入查询状态)
        inputField.hideSubMitBtn()
        inputField.hideInputField()
        listView.reloadData()
 //       let position = wholeArray.count - 1
//        let lastIndex = IndexPath.init(row: position, section: 0)
//            listView.scrollToRow(at: lastIndex, at: UITableViewScrollPosition.bottom, animated: true)
        
    }
    
    func onSuccessQuery() {
        inputField.inputTextField.text = ""
        listView.reloadData()
    }
    
    func onFalesQuery() {
        
    }
 /********************************************************************************************************/
    //1,水印功能
    func setWatermark() ->Void
    {
      //水印：传入用户名和用户手机号码生成水印
        let user = UserDefaults.standard
//        let userName :String = user.value(forKey: "username") as! String
//        let mobieNum :String = user.value(forKey: "mobile") as! String
        
        waterMarkSetWithUserNameAndMobieNum(name: "xiaoming", mobieNum:"15189967083")

    }
 
    func waterMarkSetWithUserNameAndMobieNum(name:String, mobieNum:String)->Void
    {
       let defaultSize = UIScreen.main.bounds.size
       let waterMarkSquare = defaultSize.width * defaultSize.width + defaultSize.height * defaultSize.height
       let line = sqrt(waterMarkSquare)
       let bg_Img = UIImage.uiImageWithSize(size: CGSize.init(width: line, height: line), color: UIColor.clear)
       let markImage = bg_Img.uiImageWithParts(name: name, mobile: mobieNum)
       self.warterMarkView.image = markImage
       self.view .addSubview(self.warterMarkView)
       setWaterMarkFrame(line: line)
        
    }
    //2,设置界面元素的约束:VFL法创建约束
    func setViewElementFrame()->Void
    {
        self.view .addSubview(self.centerLabel)
        self.view .addSubview(self.listView)
        //禁用auturezing
        self.listView.translatesAutoresizingMaskIntoConstraints = false
        self.centerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //设置tableView水平线上的相对约束
        /*withVisualFormat:提供执行的约束语句
         *options：对齐的方式
         *metric：VFL中的变量
         *views：VFL中用到的控件
         */
        let viewDict = ["listview":self.listView]
        let lh_contraints     = "H:|-(-8)-[listview]-(-8)-|"
        let lh_contraintsArr  = NSLayoutConstraint.constraints(withVisualFormat: lh_contraints, options: NSLayoutFormatOptions(rawValue: UInt(0)), metrics: nil, views: viewDict)
        //高度上需要计算两个高度：@1，状态栏的高度 @2，导航栏的高度
        let state_height = UIApplication.shared.statusBarFrame.size.height
        let navi_height  = self.navigationController?.navigationBar.frame.size.height
        let lwhole_height = state_height + navi_height!
        let lv_constraints = "V:|-lwhole_height-[listview]-keyboardHeight-|"
        let lv_contrainstsArr = NSLayoutConstraint.constraints(withVisualFormat: lv_constraints, options: NSLayoutFormatOptions(rawValue: UInt(0)), metrics: ["lwhole_height" : lwhole_height , "keyboardHeight" : self.keyboardHeight], views: viewDict)
        
        //把listView的约束设置到View上
        self.view.addConstraints(lh_contraintsArr)
        self.view.addConstraints(lv_contrainstsArr)
        
        //centerView只需要实现垂直水平居中，并给定宽度高度就可以了
        let labelDict = ["label":self.centerLabel]
        let ch_constraints    = "H:|-[label]-|"
        let ch_contraintsArr  = NSLayoutConstraint.constraints(withVisualFormat: ch_constraints, options: NSLayoutFormatOptions.alignAllCenterX, metrics: nil, views: labelDict)
        let cv_constraints    = "V:|-[label]-|"
        let cv_contraintsArr  = NSLayoutConstraint.constraints(withVisualFormat: cv_constraints, options: NSLayoutFormatOptions.alignAllCenterX, metrics: nil, views: labelDict)
        self.view.addConstraints(ch_contraintsArr)
        self.view.addConstraints(cv_contraintsArr)
        
    }
    
    func setWaterMarkFrame(line:CGFloat) ->Void
    {
        self.warterMarkView.translatesAutoresizingMaskIntoConstraints = false
        let dic = ["watermark":self.warterMarkView]
        let wh_constraints = "H:|-[watermark(line)]-|"
        let wh_constraintsArr = NSLayoutConstraint.constraints(withVisualFormat: wh_constraints, options: NSLayoutFormatOptions.alignAllCenterX, metrics: ["line":line], views: dic)
        let wv_constraints = "V:|-[watermark(line)]-|"
        let wv_constraintsArr = NSLayoutConstraint.constraints(withVisualFormat: wv_constraints, options: NSLayoutFormatOptions.alignAllCenterY, metrics: ["line":line], views: dic)
        self.view .addConstraints(wh_constraintsArr)
        self.view .addConstraints(wv_constraintsArr)
    }
    
    //3.设置右侧导航图标
    func setRightNavItem()
    {
        //设置自定义导航按钮的文字和图标
        let rightBtn = UIButton.init(type: UIButtonType.custom)
            rightBtn.frame = CGRect.init(x: 275, y: 0, width: 100, height: 40)
            rightBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
            rightBtn.setTitle("帮助", for: UIControlState.normal)
            rightBtn.setTitleColor(UIColor.uiColor(value: "#3498db"), for: UIControlState.normal)
            rightBtn.setTitleColor(UIColor.white, for: UIControlState.highlighted)
            rightBtn.addTarget(self, action: #selector(pushViewController(sender:)), for: UIControlEvents.touchUpInside)
            rightBtn.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: 80, bottom: 0, right: 0)
        setBtnBackImage(btn:rightBtn)
        
        let riaght_Bar = UIBarButtonItem.init(customView: rightBtn)
        self.navigationItem.rightBarButtonItem = riaght_Bar
   
    }
    
    func setBtnBackImage(btn:UIButton)
    {
        let normal_Icon = FAKFontAwesome.angleRightIcon(withSize: 30)
        normal_Icon?.addAttribute(NSForegroundColorAttributeName, value: UIColor.uiColor(value: "#3498db"))
        let normal_Image = normal_Icon?.image(with: CGSize.init(width: 24, height: 40))
            btn.setImage(normal_Image, for: UIControlState.normal)
        let spec_Icon  = FAKFontAwesome.angleRightIcon(withSize: 40)
            spec_Icon?.addAttribute(NSForegroundColorAttributeName, value: UIColor.white)
        let spec_Image = spec_Icon?.image(with: CGSize.init(width: 24, height: 40))
            btn.setImage(spec_Image, for: UIControlState.highlighted)
    }
    
    
   /****************************************************************************************************/
    //1.rightBtn的事件处理
    func pushViewController(sender:UIButton)
    {
       let versionVC = VersonHelpVC()
        self.navigationController?.pushViewController(versionVC, animated: false)
    }
}

