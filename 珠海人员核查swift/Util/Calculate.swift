//
//  Calculate.swift
//  珠海人员核查swift
//
//  Created by 冯学仕 on 17/6/28.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit

class Calculate: NSObject {
    
    static func  meareText(text:String , font:UIFont , maxSize:CGSize) ->CGSize
    {
        let nText = NSString.init(string: text)
        let opt   = Combines.combine()
        let style = NSMutableParagraphStyle.init()
            style.lineBreakMode = NSLineBreakMode.byCharWrapping
        let dic   = [NSFontAttributeName : font , NSParagraphStyleAttributeName : style] as [String : Any]
        return nText.boundingRect(with: maxSize, options: opt, attributes: dic, context: nil).size
    }

}
