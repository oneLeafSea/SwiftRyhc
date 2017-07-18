//
//  RequestParam.swift
//  珠海人员核查swift
//
//  Created by 冯学仕 on 17/6/26.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit

class RequestParam: NSObject {
    
    let user = UserDefaults.standard
    
    var userName: String?
    var userId  : String?
    var mobile  : String?
    var acToken : String?
    var uuid    : String?
    var orgid   : String?
    var identifier : String?
    var appVerson : String?
    
    func getIdentifier(id:String)
    {
        self.identifier = id
    }
    
    func getRequestParam()
    {
     userId   =  user.value(forKey: "userId") as! String?
     userName =  user.value(forKey: "userName") as! String?
     acToken  =  user.value(forKey: "accessToken") as! String?
     mobile   =  user.value(forKey: "mobile") as! String?
     orgid    =  user.value(forKey: "orgid") as!String?
     uuid     =  UUID.init().uuidString
     let infoDiction = Bundle.main.infoDictionary
     appVerson = infoDiction!["CFBundleShortVersionString"] as! String?
    }
    
    func setDic() -> [String : String]
    {
        if userId   == nil { userId = "" }
        if userName == nil {userName = ""}
        if acToken  == nil {acToken = "" }
        if mobile   == nil {mobile = ""  }
        if orgid    == nil {orgid = ""   }
        if uuid     == nil {uuid = ""    }
        if appVerson == nil {appVerson = ""}
       return   ["userid":self.userId!, "username":self.userName!, "accesstoken":acToken!, "sfzh":identifier!, "mobile":mobile!, "uuid":uuid!, "version":appVerson!, "orgid":orgid!]
        
    }
}
