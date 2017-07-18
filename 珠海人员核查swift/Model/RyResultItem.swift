//
//  RyResultItem.swift
//  珠海人员核查swift
//
//  Created by 冯学仕 on 17/6/26.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit

class RyResultItem: NSObject {
    var color : String = "" //颜色
    var name  : String = "" //核查结果keyValue
    var key  : String = "" //核查结果key
    var value: String = "" //核查结果value
    
    
    var hcjgkey   : String   = ""
    var wfjlKey   : String   = ""
    var hcjgName  : String   = ""
    var wfjlName  : String   = ""
    var wfjlArr   : [String] = [String]()
    var hcjgValue : NSAttributedString   = NSAttributedString.init()
    
    override init() {
        hcjgkey = "hcjg"
        hcjgName = "核查结果"
        wfjlKey  = "wfjl"
        wfjlName = "违法记录"
    }
    
    func parseData(result:Any)
    {
        if let dictionary:[String:String] = result as? [String : String]
        {
            color = dictionary["c"]!
            name   = dictionary["l"]!
            key  = dictionary["n"]!
            value = dictionary["v"]!
        }
    }
    
    func isErr() ->Bool
    {
        return color.isEmpty || name.isEmpty || key.isEmpty || value.isEmpty
    }
    
    func isRyheadIcon()->Bool
    {
        return key == "XP"
    }
    
    func isCompareResultItem() ->Bool
    {
        return key == hcjgkey
    }
    
    func createHeadImage() ->UIImage
    {
        let isHead :Bool = isRyheadIcon()
         if isHead == false  {return UIImage.init()}
        let data = NSData.init(base64Encoded: value, options: NSData.Base64DecodingOptions.init(rawValue: 0))
        return UIImage.init(data: data as! Data)!
    }
    
    static func createHcjgitem(compareResult:inout[RyCompareItem]) -> RyResultItem
    {
        let compareDataItem = RyResultItem.init()
        var compareBuf = ""
        let compareAttrString = NSMutableAttributedString.init()
        for i in 0...compareResult.count
        {
            let compareItem = compareResult[i]
                compareBuf = compareBuf.appending(compareItem.desc)
            let attrString = NSAttributedString.init(string: compareItem.desc, attributes: [NSForegroundColorAttributeName: UIColor.uiColor(value: compareItem.color) ,NSFontAttributeName :UIFont.systemFont(ofSize: 18)])
            
           let space = NSAttributedString.init(string: "、")
              compareAttrString.append(attrString)
            if i == compareResult.count - 1 {continue}
               compareAttrString.append(space)
               compareBuf = compareBuf.appending("、")
            
        }
        
        compareDataItem.key = compareDataItem.hcjgkey
        compareDataItem.name = compareDataItem.hcjgName
        compareDataItem.value = compareBuf
        compareDataItem.hcjgValue = compareAttrString
        return compareDataItem
    }
    
    static func createWjjlItem(isWfjl:Bool , illegaArr:[String]) ->RyResultItem
    {
        let illegaDataItem = RyResultItem.init()
           if isWfjl
           {
            illegaDataItem.key = illegaDataItem.wfjlKey
            illegaDataItem.value = "\(illegaArr.count)条违法数据"
            illegaDataItem.name = illegaDataItem.wfjlName
             for illegaString in illegaArr
              {
                illegaDataItem.wfjlArr.append(illegaString)
              }
           }
        return illegaDataItem
    }
}
