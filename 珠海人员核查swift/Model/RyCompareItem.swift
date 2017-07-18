//
//  RyCompareItem.swift
//  珠海人员核查swift
//
//  Created by 冯学仕 on 17/6/26.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit

class RyCompareItem: NSObject {
    var color : String = "" //比对的颜色
    var desc  : String = "" //比对描述
    var code  : String = "" //身份代码，暂不用
    var weight: String = "" //权重
    
    func parseData(result:Any)
    {
        if let dictionary:[String:String] = result as? [String : String]
        {
            color = dictionary["c"]!
            desc  = dictionary["l"]!
            code  = dictionary["n"]!
            weight = dictionary["v"]!
        }
    }
    
    func isErr() ->Bool
    {
        return color.isEmpty || desc.isEmpty || code.isEmpty || weight.isEmpty
    }
    
    func isQgCk() ->Bool
    {
        return code == "1"
    }
    
    func isIllega() ->Bool
    {
        return code == "wfjl"
    }
    
    func getIllageData(itemObject:Any) -> [String]
    {
        if let illageDic:[String : String] = itemObject as? [String:String]
        {
            let illageString = illageDic["v"]
            let illageArr : [String] = NSString.init(string: illageString!).components(separatedBy: "\t")
            var muIllageArr : [String] = [String]()
            for illage in illageArr {
                muIllageArr.append(illage)
            }
            return muIllageArr
        }
        return []
    }

}
