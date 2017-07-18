//
//  RyhcCell.swift
//  珠海人员核查swift
//
//  Created by 冯学仕 on 17/6/19.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit

class RyhcCell: UITableViewCell {
    //总数据
    var allItems: [RyResultItem] = [RyResultItem]()
    //初始化各项启始值
    //1.总共可能需要的正常视图的个数
    private var allNeedNormalItemViews : Int = 0
    //2.总共需要包含图片的个数
    private var allNeedSpecItemViews :Int = 0
    
    //存放正常视图的容器
    var normalItems : [RyItemCell] = [RyItemCell]()
    //存放特殊视图的容器
    var specItems : [RyItemCell] = [RyItemCell]()
    
    //约束
    private  var queryTime_hconstaintsArr = [NSLayoutConstraint]()
    private  var id_hconstaintsArr        = [NSLayoutConstraint]()
    private  var queryIndotorConstaints   = [NSLayoutConstraint]()
    private  var id_vInqueryConstaintsArr = [NSLayoutConstraint]()
    
    lazy var queryTimeView : UILabel = {
        var label = UILabel.init()
            label.font = UIFont.systemFont(ofSize: 14)
            label.textAlignment = NSTextAlignment.center
            label.backgroundColor = UIColor.clear
            label.isHidden = true
        return label
    }()
    
    lazy var identifierView : UITextField = {
        var  textField = UITextField.init()
             textField.font = UIFont.systemFont(ofSize: 18)
             textField.backgroundColor = UIColor.clear
             textField.textAlignment = NSTextAlignment.center
             textField.layer.cornerRadius = 5.0
             textField.isHidden = true
             textField.layer.backgroundColor = UIColor.uiColor(value: "#82e866").cgColor
        return textField
    }()
    
    lazy var indicatorView :UIActivityIndicatorView = {
         var indicator = UIActivityIndicatorView.init()
             indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
             indicator.isHidden = true
        return indicator
    }()
    
    lazy var resultTimeView :UILabel = {
         var label = UILabel.init()
             label.font = UIFont.systemFont(ofSize: 14)
             label.backgroundColor = UIColor.clear
             label.textAlignment = NSTextAlignment.center
             label.isHidden = true
       return label
    }()
    
    lazy var resultBgView : UIImageView = {
        var imageView = UIImageView.init()
            imageView.layer.cornerRadius = 5.0
            imageView.isHidden = true
        return imageView
    }()
    
    lazy var falseLable : UILabel = {
        var label = UILabel.init()
            label.font = UIFont.systemFont(ofSize: 24)
            label.layer.borderWidth = 0
        return label
    }()
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configDataWith(data:RyItem)
    {
        setInqueryFrame()
        switch data.state {
        case QueryState.Query_Intime:
             queryTimeView.text = DateFormatter.init().setDate()
             identifierView.text = data.identifier
             queryTimeView.isHidden = false
             identifierView.isHidden = false
             indicatorView.isHidden = false
        case .Query_success:
            indicatorView.isHidden = true
            setSuccessFulFrame(data:data)
        case .Query_false :
            queryTimeView.text = DateFormatter.init().setDate()
            identifierView.text = data.identifier
            queryTimeView.isHidden = false
            identifierView.isHidden = false
            indicatorView.isHidden = false
        default:
            break
        }
    }
    
    func setInqueryFrame()
    {
        //添加水平方向上的视图
        let maxSize = CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        queryTimeView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(queryTimeView)
        identifierView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(identifierView)
        let queryTimeDic = ["queryTime":queryTimeView]
        let time = DateFormatter.init().setDate()
        let font = UIFont.systemFont(ofSize: 14)
        let timeSize = Calculate.meareText(text: time, font: font, maxSize: maxSize)
        let queryTime_h = "H:|-[queryTime]-|"
            queryTime_hconstaintsArr = NSLayoutConstraint.constraints(withVisualFormat: queryTime_h, options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: queryTimeDic)
        let timeH = timeSize.height + 16
        self.addConstraints(queryTime_hconstaintsArr)
        let idDic = ["identifier" : identifierView]
        let id = "32128119920619337X"
        let idFont = UIFont.systemFont(ofSize: 18)
        let idSize = Calculate.meareText(text: id, font: idFont, maxSize: maxSize)
        let idWidth = idSize.width + 16
        let idFrame_h = "H:|-9-[identifier(idWidth)]-|"
            id_hconstaintsArr = NSLayoutConstraint.constraints(withVisualFormat: idFrame_h, options: NSLayoutFormatOptions.init(rawValue: 0), metrics: ["idWidth" : idWidth], views: idDic)
        self.addConstraints(id_hconstaintsArr)
        
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(indicatorView)
        let query_Inditor = ["inditor":indicatorView]
        let queryIndotorH = "H:|-pad-[inditor(24)]-|"
            queryIndotorConstaints = NSLayoutConstraint.constraints(withVisualFormat: queryIndotorH, options: NSLayoutFormatOptions.alignAllCenterX, metrics: ["pad":(Constants.ScreenWidth / 2 - 12)], views: query_Inditor)
        self.addConstraints(queryIndotorConstaints)
        
        //添加竖直方向上的视图
        let idDicV = ["identifier" : identifierView, "queryTime":queryTimeView, "inditor":indicatorView] as [String : Any]
        let idHeight = idSize.height + 16
        let idFrame_v = "V:|-18-[queryTime(timeH)]-5-[identifier(idHeight)]-5-[inditor(24)]-|"
            id_vInqueryConstaintsArr = NSLayoutConstraint.constraints(withVisualFormat: idFrame_v, options: NSLayoutFormatOptions.init(rawValue: 0), metrics: ["idHeight":idHeight, "timeH":timeH], views: idDicV)
        self.addConstraints(id_vInqueryConstaintsArr)
        
    }
    
    
    //请求成功返回
    func setSuccessFulFrame(data :RyItem)
    {
        allItems.removeAll()
        
        for  ryResultItem in data.ryDataResult {
            allItems.append(ryResultItem)
            if ryResultItem.isRyheadIcon()
            {
                allNeedSpecItemViews += 1
                if specItems.count >= allNeedSpecItemViews {break}
                let ryItemCell = RyItemCell()
                    ryItemCell.tag = ItemTAG.spec_tag
                    specItems.append(ryItemCell)
                    resultBgView.addSubview(ryItemCell)
            }
            else
            {
                allNeedNormalItemViews += 1
                if normalItems.count >= allNeedNormalItemViews {break}
                let ryItemCell = RyItemCell()
                    ryItemCell.tag = ItemTAG.norm_tag
                    normalItems.append(ryItemCell)
                    resultBgView.addSubview(ryItemCell)
            }
        }
        var height1 :Float = 0 , height2 :Float = 0 , height3 :Float = 0
        //设置frame
        for  i in 0 ..< allItems.count
        {
            let ryResultItem = allItems[i]
             if ryResultItem.isRyheadIcon() &&  i > 0
               {
                setItemFrame(data: ryResultItem, tag: ItemTAG.spec_tag, index: i, finished: { (totalheight) in
                    height1 += totalheight
                 })
               }
            else if i > 0
              {
                 setItemFrame(data: ryResultItem, tag: ItemTAG.norm_tag, index: i, finished: { (totalHeight) in
                    height2 += totalHeight
                })
              }
            else
              {
                setCompareItemFrame(data: ryResultItem, index: i, finished: { (totalHeight) in
                    height3 += totalHeight
                })
              }
        }
        
        let allHeight = height1 + height2 + height3
        resultBgView.frame = CGRect.init(x:CGFloat(4), y:CGFloat(24), width: self.contentView.frame.size.width - 33, height: CGFloat(allHeight))
        
    }
    
    func  setItemFrame(data:RyResultItem, tag:Int , index :Int , finished: @escaping(_ totalHeight: Float) ->())
     {
        let nameSize = Calculate.meareText(text: "这是五个", font: UIFont.systemFont(ofSize: 16), maxSize: CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude))
        let valueWidth = resultBgView.frame.size.width - 43 - nameSize.width
        
        let valueSize = Calculate.meareText(text: data.value, font: UIFont.systemFont(ofSize: 16), maxSize: CGSize.init(width: valueWidth, height: CGFloat.greatestFiniteMagnitude))
        if index == resultBgView.subviews.count {return}
        let childView1: RyItemCell = resultBgView.subviews[index-1] as! RyItemCell
        let childView2: RyItemCell = resultBgView.subviews[index] as! RyItemCell
        childView1.translatesAutoresizingMaskIntoConstraints = false
        childView2.translatesAutoresizingMaskIntoConstraints = false
        
        let childDic = ["child1":childView1, "child2":childView2]
        let child_h = "H:|-4-[child2]-4-|"
        let childConstraints_hArr = NSLayoutConstraint.constraints(withVisualFormat: child_h, options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: childDic)
        let child_v = "V:[child1]-[child2(height)]"
        if childView2.tag == ItemTAG.spec_tag
        {
            let childConstaints_vArr = NSLayoutConstraint.constraints(withVisualFormat: child_v, options: NSLayoutFormatOptions.init(rawValue: 0), metrics: ["height":190], views: childDic)
            resultBgView.addConstraints(childConstraints_hArr)
            resultBgView.addConstraints(childConstaints_vArr)
            finished(190)
            childView2.setSpecData_frame(data: data)
            
        }
        else
        {
            let childConstaints_vArr = NSLayoutConstraint.constraints(withVisualFormat: child_v, options: NSLayoutFormatOptions.init(rawValue: 0), metrics: ["height":(valueSize.height + 10)], views: childDic)
            resultBgView.addConstraints(childConstraints_hArr)
            resultBgView.addConstraints(childConstaints_vArr)
            finished(Float(valueSize.height) + 10)
            childView2.setNormalData_frame(data: data, width: valueWidth)
        }
    
     }
    
    func setCompareItemFrame(data:RyResultItem, index :Int , finished: @escaping(_ totalheight:Float)->())
    {
        let nameSize = Calculate.meareText(text: "这是五个", font: UIFont.systemFont(ofSize: 16), maxSize: CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude))
        let valueWidth = resultBgView.frame.size.width - 43 - nameSize.width
        let valueSize = Calculate.meareText(text: data.value, font: UIFont.systemFont(ofSize: 16), maxSize: CGSize.init(width: valueWidth, height: CGFloat.greatestFiniteMagnitude))
        let childView0 :RyItemCell = resultBgView.subviews[0] as! RyItemCell
        let child0Dic = ["child0":childView0]
        let child_h = "H:|-4-[child0]-4-|"
        let child0_hConstaintsArr = NSLayoutConstraint.constraints(withVisualFormat: child_h, options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: child0Dic)
        resultBgView.addConstraints(child0_hConstaintsArr)
        let child_v = "V:|-4-[child0(height)]"
        let child0_vConstaintsArr = NSLayoutConstraint.constraints(withVisualFormat: child_v, options: NSLayoutFormatOptions.init(rawValue: 0), metrics: ["height":(valueSize.height + 10)], views: child0Dic)
        resultBgView.addConstraints(child0_vConstaintsArr)
        finished(Float(childView0.frame.size.height))
        
        childView0.setNormalData_frame(data: data, width: valueWidth)
    }

}
