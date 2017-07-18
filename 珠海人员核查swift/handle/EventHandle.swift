//
//  EventHandle.swift
//  珠海人员核查swift
//
//  Created by 冯学仕 on 17/6/21.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit

class EventHandle: NSObject {
    var keyBoardDelegate : KeyboadDelegate?
    var inputFieldDelegate : InputTextViewDelegate?
    static let shareInstance = EventHandle()
    
     func handleInputEvent(text: String )
    {
        keyBoardDelegate?.onInput(text: text)
    }
    
    func handleDeleteEvent()
    {
        keyBoardDelegate?.onDelete()
    }
    
    func handleDeleteAll()
    {
        keyBoardDelegate?.onDeleteAll()
    }
    
    func handleKeyBoardWillShowAction(noti:NSNotification)
    {
        inputFieldDelegate?.onKeyBoardWillShow(noti:noti)
    }
    
    func handlekeyBoardWillHideAction(noti:NSNotification)
    {
        inputFieldDelegate?.onKeyBoardWillHide(noti:noti)
    }
    
    func handleOnQueryWithNewIdentifierNum(text :String)
    {
        inputFieldDelegate?.onQueryWithTextString(text : text)
    }

}
