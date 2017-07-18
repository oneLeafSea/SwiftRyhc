//
//  ImageSet.swift
//  珠海人员核查swift
//
//  Created by 冯学仕 on 17/6/19.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit

extension UIImage {
    
    static func uiImageWithSize(size:CGSize , color:UIColor) ->UIImage
    {
        let rect = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context?.fill(rect)
        let image   = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    func uiImageWithParts(name:String, mobile:String)->UIImage
    {
       let w = self.size.width
       let h = self.size.height
       UIGraphicsBeginImageContext(self.size)
       self .draw(in: CGRect.init(x: -100 , y: -100, width: w, height: h))
       let attr = [NSFontAttributeName:UIFont.systemFont(ofSize: 16),
                    NSForegroundColorAttributeName : UIColor.uiColor(value: "#44000000")]
      let nameW  = 70 , mobileW = 200, itemH = 90
      var itemW  = 150
      
      var mark :String
      for row in stride(from: -100, to: itemH * 9, by: itemH)
      {
        var num    = 0
         for col in stride(from: -100, to: mobileW * 5, by: 120)
         {
            if num % 2 == 0
            {
                mark  = name
                itemW = nameW
            }
            else
            {
                mark  = mobile
                itemW = mobileW
            }
            let left   = col - 100
            let height = row + 9
            let mark_NS = NSString.init(string: mark)
            mark_NS.draw(in: CGRect.init(x: left, y: height, width: itemW, height: itemH), withAttributes: attr)
            num += 1
         }
      }
       let markImage = UIGraphicsGetImageFromCurrentImageContext()
           UIGraphicsEndImageContext()
       return markImage!
    }

}
