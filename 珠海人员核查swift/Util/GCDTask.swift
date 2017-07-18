//
//  GCDTask.swift
//  珠海人员核查swift
//
//  Created by 冯学仕 on 17/6/23.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit

class GCDTask: NSObject {
    
    let queueItem = DispatchWorkItem.init {
        //网络请求
    }
    let backQueue = DispatchQueue.init(label: "cn.com.rooten.back")
    
        
    
}
