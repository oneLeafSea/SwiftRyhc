//
//  QueueManager.swift
//  珠海人员核查swift
//
//  Created by 冯学仕 on 17/6/24.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit

class QueueManager: NSObject {
    
    static let shareInstance = QueueManager()
    
    var ryRequestSemp : DispatchSemaphore?
    
    //创建信号量
    
    func semaphoreCreateWithNum(num:Int) 
    {
        self.ryRequestSemp = DispatchSemaphore.init(value: num)
    }
    
    func doWork(itemWork:DispatchWorkItem,queue:DispatchQueue, updatemainThread: @escaping(()->Void))
    {
        queue.async(execute: itemWork)
        itemWork.wait()
        updatemainThread()        
    }

}
