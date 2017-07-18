//
//  ColorSet.swift
//  珠海人员核查swift
//
//  Created by 冯学仕 on 17/6/17.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit

extension UIColor {
   static func uiColor( value: String) -> UIColor
    {
        
        var alpha : UInt32 = 0
        var red   : UInt32 = 0
        var green : UInt32 = 0
        var blue  : UInt32 = 0
        if !value.hasPrefix("#") {return UIColor.init()}
        if  (value.characters.count != 7 && value.characters.count != 9)  { return UIColor.init() }
        
        if value.characters.count == 7
        {
            Scanner.init(string: value[1..<3]).scanHexInt32(&red)
            Scanner.init(string: value[3..<5]).scanHexInt32(&green)
            Scanner.init(string: value[5..<7]).scanHexInt32(&blue)
            
            return UIColor.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1.0)
        }
        else
        {
            Scanner.init(string: value[1..<3]).scanHexInt32(&alpha)
            Scanner.init(string: value[3..<5]).scanHexInt32(&red)
            Scanner.init(string: value[5..<7]).scanHexInt32(&green)
            Scanner.init(string: value[7..<9]).scanHexInt32(&blue)
            
            return UIColor.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: CGFloat(alpha)/255.0)
        }
                
    }
    
   }
