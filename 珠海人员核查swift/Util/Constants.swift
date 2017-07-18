//
//  Constants.swift
//  珠海人员核查swift
//
//  Created by 冯学仕 on 17/6/21.
//  Copyright © 2017年 rooten. All rights reserved.
//

import Foundation

struct Constants {
    static let lineSize = 1 // 线宽
    static let InputColumn = 3 //列数
    static let InputRow = 4   //行数
    static let LineColor = UIColor.uiColor(value: "#88c9c9c9")  //线条的颜色
    static let ScreenWidth = UIScreen.main.bounds.size.width //屏幕的宽度
    static let ScreenHeight = UIScreen.main.bounds.size.height //屏幕的高度
    static let Hor_spacing = 9  //水平间距
    static let Ver_spacing = 6  //垂直间距
    static let SubmitBtnWidth = 56  //提交按钮的整体宽
    static let SubWidth = 50   //提交按钮真实宽
    
}

struct ConstantNames {
    static let AppVersion = "2.2.0"
    static let AppName    = "人员核查"
    static let AppCheckTask = "cn.com.rooten.Check"
    static let DataGetten  = "cn.com.rooten.RequestRyData"
}


enum QueryState : String{
    case Query_default = "无状态"
    case Query_Intime = "正在查询"
    case Query_false  = "查询失败"
    case Query_success = "查询成功"
}

struct UrlContants {
    static let RYCONNECT_URL = "http://219.131.222.93:8001/rchc/ry"
}

enum QueryErr : Error{
    case ALLDATA_NIL
    case COMPARERESULT_NIL
    case EXTDATA_NIL
    case RESULT_NIL
}

struct ItemTAG {
    static let spec_tag = 1 * 1000
    static let norm_tag = 2 * 1000
}
