//
//  ParseCenter.swift
//  珠海人员核查swift
//
//  Created by 冯学仕 on 17/6/27.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit

class ParseCenter: NSObject {
    //解析compareItem数据
    static  func parseCompareItem(allJson : [String :Any], compareResult : inout [RyCompareItem], illegalArr: inout [String] , isWfjl: inout Bool)
    {
        var illegaDic : [String : RyCompareItem] = [String :RyCompareItem]()
        if let compareArr :[RyCompareItem] = allJson["compareresult"] as?[RyCompareItem]
        {
            //1.compareArr长度为0
            if compareArr.count < 1
            {
                
                let compareItem = RyCompareItem()
                compareItem.desc = "正常"
                compareItem.color = "000000"
                compareResult.append(compareItem)
                isWfjl = false
            }
            
            //获取每一项并解析
            let sum = compareArr.count
                illegalArr.removeAll()
            for itemCompare in compareArr {
                let compareItem = RyCompareItem.init()
                compareItem.parseData(result: itemCompare)
                if compareItem.isErr() {continue}
                if (compareItem.isQgCk() && (sum > 1)) {continue}
                if compareItem.isQgCk()
                {
                    compareItem.desc = "正常"
                    isWfjl = false
                }
                else
                {
                    if compareItem.isIllega()
                    {
                        isWfjl = true
                    let illgeAdd : [String] = compareItem.getIllageData(itemObject: itemCompare)
                        for illega in illgeAdd{
                            illegalArr.append(illega)
                        }
                    }
                }
                illegaDic = [compareItem.desc : compareItem]
            }
            let allIllegaKeys = illegaDic.keys
                for illegaKey in allIllegaKeys
                {
                    let ryCompareItem = illegaDic[illegaKey]
                        compareResult.append(ryCompareItem!)
            }
        }
        
    }
    
    //解析extParam数据
    static func parseExtItem(allJson:[String:Any],extParams: inout[String : String])
    {
        if let extDic : [String : String] = allJson["ext"] as?[String: String]
        {
            extParams = extDic
            let orgId = extDic["orgid"]
            let userId = extDic["userid"]
            let username = extDic["username"]
            let mobile   = extDic["mobile"]
            let user = UserDefaults.standard
            user.set(orgId, forKey: "orgid")
            user.set(userId, forKey: "userid")
            user.set(username, forKey: "username")
            user.set(mobile, forKey: "mobile")
            
        }
    }
    
    //解析ryDataResult数据
    static func parseRyResultData(allJson:[String:Any],ryDataResult: inout[RyResultItem])
    {
        if let resultArray :[RyResultItem] = allJson["result"] as?[RyResultItem]
        {
            for itemResult in resultArray
            {
                let ryDataItem = RyResultItem.init()
                    ryDataItem.parseData(result: itemResult)
                if ryDataItem.isErr() {continue}
                ryDataResult.append(ryDataItem)
                
            }
        }
    }

}
