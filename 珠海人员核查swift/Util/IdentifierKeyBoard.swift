//
//  IdentifierKeyBoard.swift
//  珠海人员核查swift
//
//  Created by 冯学仕 on 17/6/20.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit
import FontAwesomeKit

class IdentifierKeyBoard: UIView  {
    var btnWith :CGFloat!
    var btnHeight :CGFloat!
    var datas : Array<String>!
    
    let eventHandle = EventHandle.shareInstance
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.uiColor(value: "#f2f2f2")
        loadView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadView() ->Void
    {
        datas = ["1","2","3","4","5","6","7","8","9","X","0","删除"]
        let linSize  = CGFloat( Constants.lineSize)
        let maxRow  = CGFloat( Constants.InputRow )
        let maxCol  = CGFloat ( Constants.InputColumn)
        let inputWidth  = self.frame.size.width
        let inputHeight = self.frame.size.height
        //初始化每个按钮的宽高
        btnWith = (inputWidth - (maxCol-1) * linSize) / maxCol
        btnHeight = (inputHeight - (maxRow-1) * linSize)/maxRow
        //遍历设置每行每列的按钮
        for i in 1...Int(maxRow )
        {
            for j in 1...Int(maxCol)
            {
               let index = j + (i-1) * Int(maxCol)
               addBtnWithParamters(row: i, col: j, index: index)
                if (i == 1 && j < Int(maxCol))
                {
                    addVertrialLine(col: j)
                }
            }
            
            if (i < Int(maxRow))
            {
                addHorizontalLine(row: i)
            }
        }
    }
    
    //具体的设置每一个btn
    func addBtnWithParamters(row: Int , col:Int , index : Int) {
        let btn_x = (col - 1) * Int(btnWith) + (col - 1) * Constants.lineSize
        let btn_h = (row - 1) * Int (btnHeight) + (row - 1) * Constants.lineSize
        
        let btn_rect = CGRect.init(x: btn_x, y: btn_h, width:Int(btnWith), height: Int(btnHeight))
        let btn = UIButton.init(frame: btn_rect)
            btn.tag = index
        
        //设置btn的内容显示
        setbtnTitleWithParmeters(index: index, btn: btn)
        
        //设置btn的点击事件
        btn.addTarget(self, action:#selector(onBtnTapped(sender:)) , for: UIControlEvents.touchUpInside)
        
        //设置btn的长按事件
        let longPress = UILongPressGestureRecognizer.init(target: self, action: #selector(onBtnLongPressed(sender:)))
        longPress.minimumPressDuration = 0.5
        btn .addGestureRecognizer(longPress)
        
        self.addSubview(btn)
    }
    
    //设置btn的内容显示
    func setbtnTitleWithParmeters(index: Int , btn :UIButton)
    {
        if index == 12
        {
           setSpecialIndex(index: index, btn: btn)
        }
        else
        {
            setNormalIndex(index: index, btn: btn)
        }
    }
    
    func setNormalIndex(index: Int , btn : UIButton)
    {
          btn.setTitle(datas[index-1], for: UIControlState.normal)
          btn.titleLabel?.font = UIFont.init(name: "GillSans", size: 24)
          btn.setTitleColor(UIColor.black, for: UIControlState.normal)
        
        //设置btn显示的背景图片
        let btnSize = CGSize.init(width: btnWith, height: btnHeight)
        let normalImage = UIImage.uiImageWithSize(size: btnSize, color: UIColor.uiColor(value: "#333498db"))
          btn.setImage(normalImage, for: UIControlState.highlighted)
    }
    
    func setSpecialIndex(index:Int , btn: UIButton)
    {
        let iconSize =   btnHeight * 2 / 5
        let speIconNor = FAKIonIcons.backspaceOutlineIcon(withSize: iconSize)
        let speIconHig = FAKIonIcons.backspaceIcon(withSize: iconSize)
        
            speIconNor?.addAttribute(NSForegroundColorAttributeName, value: UIColor.black)
        let spe_norImage = speIconNor?.image(with: CGSize.init(width: btnWith, height: btnHeight))
            btn.setImage(spe_norImage, for: UIControlState.normal)
        
            speIconHig?.addAttribute(NSForegroundColorAttributeName, value: UIColor.black)
        let spe_higImage = speIconHig?.image(with: CGSize.init(width: btnWith, height: btnHeight))
            btn.setImage(spe_higImage, for: UIControlState.highlighted)
        
    }
    
    //添加y轴方向的线
    func addVertrialLine(col :Int)
    {
        let line_x = col * Int(btnWith) + (col - 1) * Constants.lineSize
        let lineRect = CGRect.init(x: line_x, y: 0, width: Constants.lineSize, height: Int(self.frame.size.height))
        let line = UIView.init(frame: lineRect)
            line.backgroundColor = Constants.LineColor
        self.addSubview(line)
    }
    
    //添加x轴方向的线
    func addHorizontalLine(row : Int)
    {
        let line_y = row * Int(btnHeight) + (row - 1) * Constants.lineSize
        let lineRect = CGRect.init(x: 0, y: line_y, width: Int(self.frame.size.width), height: Constants.lineSize)
        let line = UIView.init(frame: lineRect)
            line.backgroundColor = Constants.LineColor
        self.addSubview(line)
    }
    
    //btn的点击事件
    func onBtnTapped(sender:UIButton)
    {
        let tag  = sender.tag
        let text = sender.titleLabel?.text
        switch tag {
        case 12:
            eventHandle.handleDeleteEvent()
        default:
            eventHandle.handleInputEvent(text:text!)
        }
    }
    
    //btn长按
    func onBtnLongPressed(sender:UIButton)
    {
        eventHandle.handleDeleteAll()
    }

}
