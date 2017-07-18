//
//  VersonHelpVC.swift
//  珠海人员核查swift
//
//  Created by 冯学仕 on 17/6/23.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit
import FontAwesomeKit


class VersonHelpVC: UIViewController {
    let dealString = "  “人员核查”可以通过输入人员身份证来查询珠海大数据平台的全国常口接口信息，并对人员身份进行核查。\n  主要核查结果包括以下几种，以不同颜色区分身份等级:\n  1: 红色：全国在逃\n  2: 橙色：全国吸贩毒信息\n  3: 橙色：全国七类重点人员\n  4: 蓝色：警综嫌疑人\n  5: 蓝色：全国违法\n  6: 黑色：正常"
    
    /****************************************************************************************/
    lazy var scroolView :UIScrollView = {
         var scrolView = UIScrollView.init(frame: self.view.frame)
             scrolView.backgroundColor = UIColor.white
     return scrolView
    }()
    lazy var headView :UIView = {
        var hview = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: 80))
            hview.layer.borderWidth = 0.5
            hview.layer.borderColor = UIColor.gray.cgColor
        return hview
    }()
    lazy var headImageView : UIImageView = {
        let frame = CGRect.init(x: 9, y: 9, width: 62, height: 62)
        var imageView = UIImageView.init(frame: frame)
            imageView.image = UIImage.init(named: "renyuan")
        return imageView
    }()
    lazy var headNameLabel :UILabel = {
       var lable = UILabel.init(frame: CGRect.init(x: 80, y: 9, width: 80, height: 30))
           lable.text = ConstantNames.AppName
           lable.font = UIFont.systemFont(ofSize: 18)
           return lable
    }()
    lazy var headVersionLabel : UILabel = {
         var label = UILabel.init(frame: CGRect.init(x: 80, y: 48, width: 120, height: 25))
             label.text = ConstantNames.AppVersion
             label.textColor = UIColor.lightGray
             label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    lazy var textLable : UILabel = {
       var label = UILabel.init(frame: CGRect.init(x: 0, y: 80, width: Constants.ScreenWidth, height: 35))
           label.text = "使用帮助："
           label.font = UIFont.systemFont(ofSize: 17)
           label.backgroundColor = UIColor.lightGray
           label.layer.borderWidth = 0.5
           label.layer.borderColor = UIColor.lightGray.cgColor
        return label
    }()
    lazy var detailView :UITextView = {
        var textView = UITextView.init()
        let attrStr = self.changeStringToAttrString()
            textView.attributedText = attrStr
            textView.font = UIFont.systemFont(ofSize: 16)
            textView.isUserInteractionEnabled = false
            textView.layer.borderWidth = 0.5
            textView.layer.borderColor = UIColor.lightGray.cgColor
            textView.textContainerInset = UIEdgeInsets.init(top: 2, left: 5, bottom: 2, right: 5)
        let size = CGSize.init(width: Constants.ScreenWidth, height: CGFloat.greatestFiniteMagnitude)
        let constainter = textView.sizeThatFits(size)
            textView.frame = CGRect.init(x: 0, y: 115, width: Constants.ScreenWidth, height: constainter.height)
        return textView
    }()
    lazy var companySupport : UILabel = {
         var label = UILabel.init(frame: CGRect.init(x: 0, y:Constants.ScreenHeight - 116, width:Constants.ScreenWidth, height: 50))
             label.text = "  技术支持 : 苏州路腾软件有限公司"
             label.textColor = UIColor.lightGray
             label.layer.borderWidth = 0.5
             label.layer.borderColor = UIColor.lightGray.cgColor
             label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setleftbackBtn()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initSubView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    /***************************************************************************/
    //1.addView
    func initSubView()
    {
        self.view.addSubview(scroolView)
        scroolView.addSubview(headView)
        initHeadChildView()
        scroolView.addSubview(textLable)
        scroolView.addSubview(detailView)
        scroolView.addSubview(companySupport)
        
    }
    
    func initHeadChildView()
    {
        headView.addSubview(headImageView)
        headView.addSubview(headNameLabel)
        headView.addSubview(headVersionLabel)
    }
    
    //2.设置富文本
    func changeStringToAttrString() -> NSAttributedString
    {
        let defaultString = "  “人员核查”可以通过输入人员身份证来查询珠海大数据平台的全国常口接口信息，并对人员身份进行核查。\n  主要核查结果包括以下几种，以不同颜色区分身份等级:\n"
        let redString = "1: 红色：全国在逃\n"
        let orangeString = "2: 橙色：全国吸贩毒信息\n"
        let orgSevenString = "3: 橙色：全国七类重点人员\n"
        let blueString   = "4: 蓝色：警综嫌疑人\n"
        let blueWfString = "5: 蓝色：全国违法\n"
        let blackString = "6: 黑色：正常"
        
        let red = NSAttributedString.init(string: redString, attributes: [NSForegroundColorAttributeName : UIColor.red])
        let org = NSAttributedString.init(string: orangeString, attributes: [NSForegroundColorAttributeName : UIColor.orange])
        let orgS = NSAttributedString.init(string: orgSevenString, attributes: [NSForegroundColorAttributeName : UIColor.orange])
        let blue = NSAttributedString.init(string: blueString, attributes: [NSForegroundColorAttributeName : UIColor.blue])
        let blueWf = NSAttributedString.init(string: blueWfString, attributes: [NSForegroundColorAttributeName : UIColor.blue])
        let black = NSAttributedString.init(string: blackString, attributes: [NSForegroundColorAttributeName : UIColor.black])
        let mutableString = NSMutableAttributedString.init()
            mutableString.append(NSMutableAttributedString.init(string:defaultString))
            mutableString.append(red)
            mutableString.append(org)
            mutableString.append(orgS)
            mutableString.append(blue)
            mutableString.append(blueWf)
            mutableString.append(black)
        return mutableString
    }
    
    //3.返回图标
    func setleftbackBtn()
    {
        //设置自定义导航按钮的文字和图标
        let leftbtn = UIButton.init(type: UIButtonType.custom)
            leftbtn.frame = CGRect.init(x: 0, y: 0, width: 70, height: 40)
            leftbtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
            leftbtn.setTitle("返回", for: UIControlState.normal)
            leftbtn.setTitleColor(UIColor.uiColor(value: "#3498db"), for: UIControlState.normal)
            leftbtn.setTitleColor(UIColor.white, for: UIControlState.highlighted)
            leftbtn.addTarget(self, action: #selector(popViewController(sender:)), for: UIControlEvents.touchUpInside)
            leftbtn.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: -3, bottom: 3, right: 0)
        setBtnBackImage(btn:leftbtn)
        
        let left_bar = UIBarButtonItem.init(customView: leftbtn)
        self.navigationItem.leftBarButtonItem = left_bar
        
    }
    
    func setBtnBackImage(btn:UIButton)
    {
        let normal_Icon = FAKFontAwesome.angleLeftIcon(withSize:30)
        normal_Icon?.addAttribute(NSForegroundColorAttributeName, value: UIColor.uiColor(value: "#3498db"))
        let normal_Image = normal_Icon?.image(with: CGSize.init(width: 24, height: 40))
        btn.setImage(normal_Image, for: UIControlState.normal)
        let spec_Icon  = FAKFontAwesome.angleLeftIcon(withSize: 40)
        spec_Icon?.addAttribute(NSForegroundColorAttributeName, value: UIColor.white)
        let spec_Image = spec_Icon?.image(with: CGSize.init(width: 24, height: 40))
        btn.setImage(spec_Image, for: UIControlState.highlighted)
    }
  /*******************************************************************************************************/
    func popViewController(sender:UIButton)
    {
        self.navigationController?.popViewController(animated: false)
    }
}
