//
//  FilterManager.swift
//  珠海人员核查swift
//
//  Created by 冯学仕 on 17/6/23.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit

class FilterManager: NSObject {
    
    static let shareInstance = FilterManager()
    
    func checkIdentifierWithId(string : String) ->Bool
    {
        if string.isEmpty {return false}
        var birthDate = ""
        do
        {
         let regularExpression = try NSRegularExpression.init(pattern: "[\\d]+[X]?", options: NSRegularExpression.Options.caseInsensitive)
         let length = string.characters.count
         let numberOfMatch = regularExpression.numberOfMatches(in: string, options: NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange(0, length))
         if numberOfMatch <= 0 {return false}
            
            if (length != 15 && length != 18) {return false}
            switch length {
            case 15:
                birthDate = string[6..<12]
                birthDate  = "19+\(birthDate)"
            case 18:
                birthDate = string[6..<14]
            default: break
            }
        }catch{
            
        }
        return checkDate8(date:birthDate)
        
    }
    
    func checkDate8(date:String) ->Bool
    {
        if date.characters.count != 8 {return false}
        let year : Int32 = date[0..<4].intValue()
        let month = date[4..<6].intValue()
        let day = date[6..<8].intValue()
    return  checkDateWithDate(year: year, month: month, day: day)
    }
    
    func checkDateWithDate(year:Int32,month:Int32,day:Int32) ->Bool
    {
        if (year < 1800 || month < 1 || month > 12 || day < 1 || day > 31)  {return false}
        if (month == 2)
        {
            if (day > 29) {return false}
            if (day == 29 && !((year%4 == 0 && year%100 != 0) || year%400 == 0))
            {
                return false
            }
            return true
        }
        if (month == 4 || month == 6 || month == 9 || month == 11)
        {
            if (day < 31) {return true}
            else {return false}
        }
        return true
    }
    
    func isIdentifierLength_18(date:String) ->Bool
    {
        let length = date.characters.count
        let code = "10X98765432"
        var sum :Int32 = 0
        do{
            let regularExpress = try NSRegularExpression.init(pattern: "[\\d]+[X]?", options: NSRegularExpression.Options.caseInsensitive)
            let numberOfMatch = regularExpress.numberOfMatches(in: date, options: NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange(0, length))
            if numberOfMatch <= 0 {return false}
            
            let weight : [NSNumber] = [7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2,1]
            
           for  i in stride(from: 0, to: 17, by: 1)
           {
              sum += Int32( (date.toNS_String().character(at: i) - "0".toNS_String().character(at: 0))) * weight[i].int32Value
           }
            
        }catch
        {
            
        }
        
        let checkNum = sum % 11
        let charvalue = date.toNS_String().character(at: 17)
        let charCode = code.toNS_String().character(at: Int(checkNum))
        if (charCode == charvalue) {return true}

       return checkNum == 2 && (charvalue + ("a".toNS_String().character(at: 0) - "A".toNS_String().character(at: 0)) == charCode)
    }
    
    
    func checkIdentifierWithNum(date:String) ->Bool
    {
        return date.characters.count == 18 && checkIdentifierWithId(string: date)  && isIdentifierLength_18(date: date)
    }

}
