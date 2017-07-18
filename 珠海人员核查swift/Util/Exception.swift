//
//  Exception.swift
//  珠海人员核查swift
//
//  Created by 冯学仕 on 17/6/15.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit

class Exception: NSObject {
    
  static  func exceptionDetails()
    {
        NSSetUncaughtExceptionHandler { (exception : NSException) in
            
            let headString:String = "捕获全局异常"
            let bodyString:NSArray = exception.callStackSymbols as NSArray
            Log.logWithUsefulParamters(headString: headString, bodyString: bodyString)
            
            let reasonBody:String? = exception.reason
            Log.logWithUsefulParamters(headString: "捕获全局异常原因", bodyString: reasonBody! as NSObject)
        }
    }
    
    static func isEmptyWithVaule(value:String)->Bool
    {
        return value == "" ? false:true
    }
    
    
}
