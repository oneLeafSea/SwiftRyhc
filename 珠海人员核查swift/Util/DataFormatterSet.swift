//
//  DataFormatterSet.swift
//  珠海人员核查swift
//
//  Created by 冯学仕 on 17/6/26.
//  Copyright © 2017年 rooten. All rights reserved.
//
import UIKit
import Foundation

extension DateFormatter {
    func setDate()->String
    {
        self.dateFormat = "HH:MM:SS"
        return self.string(from: Date.init())
    }
}
