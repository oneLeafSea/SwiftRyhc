//
//  Protocl.swift
//  珠海人员核查swift
//
//  Created by 冯学仕 on 17/6/21.
//  Copyright © 2017年 rooten. All rights reserved.
//

import Foundation

protocol KeyboadDelegate {
    func onDelete()
    func onDeleteAll()
    func onInput(text:String)
}

protocol InputTextViewDelegate {
    func onQueryWithTextString(text:String)
    func onKeyBoardWillShow(noti:NSNotification)
    func onKeyBoardWillHide(noti:NSNotification)
}

protocol StateChangeDelegate {
    func onInQuery()
    func onSuccessQuery()
    func onFalesQuery()
}
