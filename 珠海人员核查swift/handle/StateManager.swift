//
//  StateManager.swift
//  珠海人员核查swift
//
//  Created by 冯学仕 on 17/6/23.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit

class StateManager: NSObject {
    
    static let shareInstance = StateManager()
    var stateDelegate: StateChangeDelegate?
    
    func doQueryWithItemCurrentState(state :QueryState)
    {
        
        switch state {
          case QueryState.Query_Intime:
            notifWindowToDealWithIn_QueryAction()
            break
        case QueryState.Query_success:
            notifWindowToDealWithSuccessAction()
            break
        case QueryState.Query_false:
            notifuWindowToDealWithFalseAction()
            break
        default:
            break
        }
    }
    
    func notifWindowToDealWithIn_QueryAction()
    {
        stateDelegate?.onInQuery()
    }
    
    func notifWindowToDealWithSuccessAction()
    {
        stateDelegate?.onSuccessQuery()
    }
    
    func notifuWindowToDealWithFalseAction()
    {
        stateDelegate?.onSuccessQuery()
    }
}
