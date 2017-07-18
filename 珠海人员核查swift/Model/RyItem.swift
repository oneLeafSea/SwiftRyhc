//
//  RyItem.swift
//  珠海人员核查swift
//
//  Created by 冯学仕 on 17/6/23.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit
class RyItem: NSObject {
    
    var state :QueryState = QueryState.Query_Intime
    let dateFormatter = DateFormatter.init()
    
    var identifier : String = ""  //查询的身份信息
    var queryTime  : String = ""  //查询的时间
    var resultTime : String = ""  //查询的返回的时间
    var compareResult : [RyCompareItem] = [RyCompareItem]() //查询的比对结果
    var extParams  :[String:String] = [String:String]()     //额外的参数
    var ryDataResult : [RyResultItem] = [RyResultItem]()       //查询结果
    var compareIllegalArr : [String] = [String]()           //违法记录
    var isWfjl    : Bool   = false
    
    func setQueryTime()
    {
        self.queryTime = dateFormatter.setDate()
    }
    
    func parseData(data:String)
    {
        //判断data数据是否为空，为空就return
        if data.isEmpty {return}
        //生成获取到的时间
        self.resultTime = dateFormatter.setDate()
        //解析
      let dataStream = data.data(using: String.Encoding.utf8)
        do{
            let resultJson  = try JSONSerialization.jsonObject(with: dataStream!, options: JSONSerialization.ReadingOptions.mutableLeaves)
            if let allJson:[String :Any] = resultJson as? [String :Any]
            {
                if allJson.isEmpty {throw QueryErr.ALLDATA_NIL}
                //解析compareItem数据
                ParseCenter.parseCompareItem(allJson: allJson, compareResult: &compareResult, illegalArr: &compareIllegalArr, isWfjl: &isWfjl)
                if compareResult.isEmpty {throw QueryErr.COMPARERESULT_NIL}
                //解析extParam数据
                ParseCenter.parseExtItem(allJson:allJson, extParams: &extParams)
                if extParams.isEmpty {throw QueryErr.EXTDATA_NIL}
                //解析result数据
                 ParseCenter.parseRyResultData(allJson: allJson, ryDataResult: &ryDataResult)
                if ryDataResult.isEmpty {throw QueryErr.RESULT_NIL}
                
                //把核查结果项和违法数据项插入到结果项
                let compareData :RyResultItem = RyResultItem.createHcjgitem(compareResult: &compareResult)
                ryDataResult.append(compareData)
                
                let illegaData : RyResultItem = RyResultItem.createWjjlItem(isWfjl: isWfjl, illegaArr: compareIllegalArr)
                if (isWfjl == true)
                {
                    ryDataResult.insert(illegaData, at: ryDataResult.count - 1)
                }
            }
               
        }catch{
            switch error {
            case QueryErr.ALLDATA_NIL:
                Log.logWithUsefulStringParamters(headString:"请求数据出错" ,bodyString:"无返回数据")
            case QueryErr.COMPARERESULT_NIL:
                Log.logWithUsefulStringParamters(headString: "请求数据出错", bodyString: "比对结果解析出错")
            case QueryErr.EXTDATA_NIL:
                Log.logWithUsefulStringParamters(headString: "请求数据出错", bodyString: "额外参数解析出错")
            case QueryErr.RESULT_NIL:
                Log.logWithUsefulStringParamters(headString: "请求数据出错", bodyString: "显示结果集解析出错")
            default:
                Log.logWithUsefulStringParamters(headString: "无错误", bodyString: "无错误")
            }
        }
      
    }
}
