//
//  SubString.swift
//  珠海人员核查swift
//
//  Created by 冯学仕 on 17/6/17.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit

/*
 *  subScript :下标
 *  在字符串的扩展中使用subscript下标实现数字索引的功能
 *
 */


// 扩展String，截取指定范围内的字符串
extension String {
    subscript (range : Range<Int>) ->String
    {
        get{
            let start = self.index(self.startIndex, offsetBy: range.lowerBound)
            let end   = self.index(self.startIndex, offsetBy: range.upperBound)
            return self[start..<end]
        }
    }
    
    subscript (index: Int) ->Character
    {
        get {
         return  self[self.index(startIndex, offsetBy: index)]
        }
    }
    func intValue() ->Int32
    {
      return  NSString.init(string: self).intValue
    }
    
    func toNS_String() -> NSString
    {
        return NSString.init(string: self)
    }
}
