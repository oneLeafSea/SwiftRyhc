//
//  InputFieldView.swift
//  珠海人员核查swift
//
//  Created by 冯学仕 on 17/6/21.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit

class InputFieldView: UIView ,KeyboadDelegate , UITextFieldDelegate{
    let eventHander = EventHandle.shareInstance
    
    lazy var hor_top : UIView = {
        let lineRect = CGRect.init(x: 0, y: 0, width: Int(self.frame.size.width), height:Constants.lineSize)
        var line = UIView.init(frame: lineRect)
            line.backgroundColor = UIColor.uiColor(value: "#88c9c9c9")
        return line
    }()
    
    lazy var hor_bottom : UIView = {
        let orign_y = Int( self.frame.size.height) - Constants.lineSize
        let lineRect = CGRect.init(x: 0, y: orign_y, width: Int(self.frame.size.width), height: Constants.lineSize)
        var line = UIView.init(frame: lineRect)
       return line
    }()
    
    lazy var inputKeyBoard : IdentifierKeyBoard = {
        let keyboardRect = CGRect.init(x: 0, y: 0, width: Constants.ScreenWidth, height: Constants.ScreenHeight / 3)
        var keyBoardView = IdentifierKeyBoard.init(frame: keyboardRect)
        
        return keyBoardView
    }()
    
    lazy var submitBtn : UIButton = {
        let oraign_x = Int( Constants.ScreenWidth) -  Constants.SubmitBtnWidth - 2 * Constants.Hor_spacing
        let width = Constants.SubWidth
        let height = Int(self.frame.size.height ) - 2 * Constants.Ver_spacing
        let btnRect = CGRect.init(x: oraign_x, y: Constants.Ver_spacing, width: width, height: height)
        var btn = UIButton.init(type: UIButtonType.custom)
            btn.frame = btnRect
            btn.backgroundColor = UIColor.red
            btn.setTitle("查询", for: UIControlState.normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            btn.isEnabled = false
            btn.layer.masksToBounds = true
            btn.layer.cornerRadius = 3.0
            btn.addTarget(self, action: #selector(onquery), for: UIControlEvents.touchUpInside)
        
       return btn
    }()
    
    lazy var inputTextField : UITextField = {
       let width = Int( Constants.ScreenWidth) - 2 * Constants.SubmitBtnWidth
       let height = Int (self.frame.size.height) - 2 * Constants.Ver_spacing
       let inputFieldRect = CGRect.init(x: Constants.Hor_spacing, y: Constants.Ver_spacing, width: width, height: height)
       var inputField = UITextField.init(frame: inputFieldRect)
           inputField.backgroundColor = UIColor.uiColor(value: "#00ffffff")
           inputField.font = UIFont.systemFont(ofSize: 16)
           inputField.adjustsFontSizeToFitWidth = true
           inputField.placeholder = "请输入身份证号"
           inputField.textAlignment = NSTextAlignment.left
           inputField.delegate = self
           inputField.borderStyle = UITextBorderStyle.none
           inputField.addTarget(self, action: #selector(didTextChanged), for: UIControlEvents.editingChanged)
     return inputField
    }()
    

  override  init(frame: CGRect) {
        super.init(frame: frame)
        eventHander.keyBoardDelegate = self
        addAllChildView()
        listenKeyboardState()
        self.backgroundColor = UIColor.white
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addAllChildView()
    {
        self.addSubview(hor_top)
        self.addSubview(inputTextField)
        inputTextField.inputView = inputKeyBoard
        self.addSubview(submitBtn)
        self.addSubview(hor_bottom)
        
    }
    
    
    
 /**************************************************************************************************/
    //监听键盘
     func listenKeyboardState()
     {
        NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardWillShow(noti:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardWillHide(noti:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
     }
    
    //键盘点击事件
    
    func onDeleteAll() {
       inputTextField.text = ""
       didTextChanged()
    }
    
    func onDelete() {
        let string :NSString = NSString.init(string: inputTextField.text!)
        let len = string.length
        if len == 0
        {
            return
        }
        var range = NSRange.init()
        range.location = 0
        range.length   = len - 1
        inputTextField.text = string.substring(with: range)
        didTextChanged()
    }
    
    func onInput(text: String) {
        inputTextField.insertText(text)
    }
    
    func onKeyboardWillShow(noti:NSNotification)
    {
          rebuildFrameWith(noti: noti)
      let text = self.inputTextField.text
      let replcaedString = NSString.init(string: text!).replacingOccurrences(of: "-", with: "")
          inputTextField.text = replcaedString
          submitBtn.isHidden = false
    }
    
    func onKeyboardWillHide(noti:NSNotification)
    {
        recoverKeyboardFrameWith(noti:noti)
    }
    
  /**************************************************************************************************/
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "0" {return true}
        if NSString.init(string: string).intValue == 0 {return false}
        return true
    }
    
    
    
  /*************************************************************************************************/
    //submitBtn的按钮状态
    func setSubmitBtnState(btn: UIButton)
    {
        if btn.isEnabled == true
        {
            btn.setTitleColor(UIColor.white, for: UIControlState.normal)
            let subNorImage = UIImage.uiImageWithSize(size: btn.frame.size, color: UIColor.uiColor(value: "#883498db"))
            btn.setBackgroundImage(subNorImage, for: UIControlState.normal)
            
            let subSpeImage = UIImage.uiImageWithSize(size: btn.frame.size, color: UIColor.init(colorLiteralRed: 0.4, green: 0.5, blue: 0.1, alpha: 1.0))
            btn.setBackgroundImage(subSpeImage, for: UIControlState.highlighted)
        }
        else
        {
            btn.setTitleColor(UIColor.gray, for: UIControlState.normal)
            let forbittenImage = UIImage.uiImageWithSize(size: btn.frame.size, color: UIColor.uiColor(value: "#eaeaea"))
            btn.setBackgroundImage(forbittenImage, for: UIControlState.normal)
        }
    }
    
  /***************************************************************************************************/
    //1.提交按钮点击事件
    func onquery()
    {
        eventHander.handleOnQueryWithNewIdentifierNum(text : inputTextField.text!)
        if FilterManager.shareInstance.checkIdentifierWithNum(date: inputTextField.text!) == false {return}
        let string = NSString.init(string: inputTextField.text!)
        let str_area = string.substring(with: NSRange.init(location: 0, length: 6))
        let str_birthY = string.substring(with: NSRange.init(location: 6, length: 4))
        let str_bitthM = string.substring(with: NSRange.init(location: 10, length: 4))
        let end_code = string.substring(with: NSRange.init(location: 14, length: 4))
        inputTextField.text = NSString.init(format: "%@-%@%@-%@", str_area,str_birthY,str_bitthM,end_code) as String
    }
    //2.inputField内容改变
    func didTextChanged()
    {
        let string = NSString.init(string: inputTextField.text!)
        let isEnable = (string.length >= 18)
        submitBtn.isEnabled = isEnable
        setSubmitBtnState(btn: submitBtn)
        if string.length < 18
        {
            return
        }
        var range = NSRange.init()
        range.location = 0
        range.length = 18
        let newString = string.substring(with: range)
        inputTextField.text = newString
    }
    
    func rebuildFrameWith(noti:NSNotification)
    {
        
        eventHander.handleKeyBoardWillShowAction(noti: noti)
        
        let dic :NSDictionary = NSDictionary.init(dictionary: noti.userInfo!)
        let nsValue = dic.object(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRec = nsValue.cgRectValue
        self.frame = CGRect.init(x: 0, y: Int(Constants.ScreenHeight - (keyboardRec.size.height) - 48), width: Int(self.frame.size.width), height: Int(self.frame.size.height))
        
    }
    
    func recoverKeyboardFrameWith(noti:NSNotification)
    {
        eventHander.handlekeyBoardWillHideAction(noti:noti)
        
        self.frame = CGRect.init(x: 0, y:Int(Constants.ScreenHeight) - 48, width: Int(self.frame.size.width), height: Int(self.frame.size.height))
    
    }
    
    //3.window点击回调
    func onTouchInWindow(uiTap : UITapGestureRecognizer)
    {
        inputTextField.resignFirstResponder()
    }
    /***************************************************************************************************/
    //public
    func touchInWindow(view: UIView)
    {
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(onTouchInWindow(uiTap:)))
            tapGesture.cancelsTouchesInView = false
            view.addGestureRecognizer(tapGesture)
    }
    
    func showInputField()
    {
        inputTextField.becomeFirstResponder()
    }
    
    func hideInputField()
    {
        inputTextField.resignFirstResponder()
    }
    
    func hideSubMitBtn()
    {
        submitBtn.isHidden = true
    }

}
