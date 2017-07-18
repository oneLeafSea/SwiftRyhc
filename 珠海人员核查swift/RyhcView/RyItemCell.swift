//
//  RyItemCell.swift
//  珠海人员核查swift
//
//  Created by 冯学仕 on 17/6/30.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit

class RyItemCell: UIView {
    
    lazy var namelabel : UILabel = {
        var label = UILabel.init()
            label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var valueLabel : UILabel = {
        var label = UILabel.init()
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var ryheadImageView : UIImageView = {
        var imgView = UIImageView.init()
            imgView.contentMode = UIViewContentMode.scaleToFill
            imgView.clipsToBounds = true
        return imgView
    }()
    
 /***********************************************************************************************/
    func setNormalData_frame(data:RyResultItem, width:CGFloat)
    {
        namelabel.text = data.name
        valueLabel.text = data.value
        
        let nameSize = Calculate.meareText(text: "这是五个", font: UIFont.systemFont(ofSize: 16), maxSize: CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude))
        let valueSize = Calculate.meareText(text:valueLabel.text!, font: UIFont.systemFont(ofSize: 16), maxSize: CGSize.init(width: width, height: CGFloat.greatestFiniteMagnitude))
        let normal_Dic = ["namelabel":namelabel,"valuelabel":valueLabel]
        let normal_h = "H:|-14-[namelabel(width)]-14-[valuelabel]-7-|"
        let normal_hConstaintsArr = NSLayoutConstraint.constraints(withVisualFormat: normal_h, options: NSLayoutFormatOptions.alignAllCenterX, metrics: ["width":nameSize.width], views: normal_Dic)
        let name_v = "V:|-7-[namelabel]"
        let name_vConstaintsArr = NSLayoutConstraint.constraints(withVisualFormat: name_v, options: NSLayoutFormatOptions.alignAllCenterX, metrics: nil, views: normal_Dic)
        let value_v = "V:|-7-[valuelabel(height)]"
        let value_vConstaintsArr = NSLayoutConstraint.constraints(withVisualFormat: value_v, options: NSLayoutFormatOptions.alignAllCenterX, metrics: ["height":valueSize.height], views: normal_Dic)
        self.addConstraints(normal_hConstaintsArr)
        self.addConstraints(name_vConstaintsArr)
        self.addConstraints(value_vConstaintsArr)
    }
    
    func setSpecData_frame(data:RyResultItem)
    {
        namelabel.text = data.name
        ryheadImageView.image = data.createHeadImage()
        
        let nameSize = Calculate.meareText(text: "这是五个", font: UIFont.systemFont(ofSize: 16), maxSize: CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude))
        let specDic = ["namelabel":namelabel, "image":ryheadImageView] as [String : Any]
        let spec_h = "H:|-14-[namelabel(width)]-14-[image(150)]-|"
        let spec_hConstaints = NSLayoutConstraint.constraints(withVisualFormat: spec_h, options: NSLayoutFormatOptions.alignAllCenterX, metrics: ["width":nameSize.width], views: specDic)
        let name_v = "V:|-[namelabel]-|"
        let name_vConstaintsArr = NSLayoutConstraint.constraints(withVisualFormat: name_v, options: NSLayoutFormatOptions.alignAllCenterY, metrics: nil, views: specDic)
        let value_v = "V:|-7-[valuelabel(190)]"
        let value_vConstaintsArr = NSLayoutConstraint.constraints(withVisualFormat: value_v, options: NSLayoutFormatOptions.alignAllCenterY, metrics: nil, views: specDic)
        self.addConstraints(spec_hConstaints)
        self.addConstraints(name_vConstaintsArr)
        self.addConstraints(value_vConstaintsArr)

    }
}
