//
//  UrlConnect.swift
//  珠海人员核查swift
//
//  Created by 冯学仕 on 17/6/20.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit


class UrlConnect: NSObject {
    
    //post请求的处理
    static func post(urlString: String, params: Dictionary<String, String>, callback: @escaping(String?,NSError?)->()) ->Void {
        
        //请求内容转换成data
        let requestData = try! JSONSerialization.data(withJSONObject: params, options: JSONSerialization.WritingOptions.prettyPrinted)
        var servString = "json="
        let Str = String.init(data: requestData, encoding: String.Encoding.init(rawValue: String.Encoding.utf8.rawValue))
            servString = servString + Str!
        
        let url = URL.init(string: urlString)
        var request = URLRequest.init(url: url!)
        request.timeoutInterval = 60
        request.httpMethod = "POST"
        request.httpBody = servString.data(using: String.Encoding.utf8)
        
        //开始请求会话
        let sessionTask = URLSession.shared
        let task  = sessionTask.dataTask(with: request) { (data,request, error) in
            if error != nil
            {
               callback(nil,error as NSError?)
            }
            else
            {
                let string = String.init(data: data!, encoding:String.Encoding.utf8)
                callback(string, nil)
            }
        }
        task.resume()
    }
}
