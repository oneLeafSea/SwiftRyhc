//
//  Log.swift
//  珠海人员核查swift
//
//  Created by 冯学仕 on 17/6/15.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit

class Log: NSObject {
    // NSObject对象打印
    static func logWithUsefulParamters(headString:String, bodyString:NSObject) -> Void {
        print("----\(headString)------>\(bodyString)")
    }
    
    // String对象打印
    static func logWithUsefulStringParamters(headString:String, bodyString:String) -> Void {
        print("----\(headString)------>\(bodyString)")
    }
    
    // Int数据类型打印
    static func logWithUsefulIntParamters(headString:String, bodyString:Int) -> Void {
        print("----\(headString)------>\(bodyString)")
    }
}
