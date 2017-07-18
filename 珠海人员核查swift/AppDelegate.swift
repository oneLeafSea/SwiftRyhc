//
//  AppDelegate.swift
//  珠海人员核查swift
//
//  Created by 冯学仕 on 17/6/15.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var state_URL : Bool = false
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
      self.window = UIWindow.init(frame: UIScreen.main.bounds)
        
      state_URL =  launchOptionWithUrlIsNotEmpty(launchOptions: launchOptions)
      
      if state_URL == false
      {
          let vc = ViewController()
          let nav = UINavigationController.init(rootViewController: vc)
          self.window?.backgroundColor = UIColor.white
          self.window?.rootViewController = nav
          self.window?.makeKeyAndVisible()
      }
       
       Exception.exceptionDetails()
        
        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        if (url.host != nil)
        {
            let hostString = url.host
            let user       = UserDefaults.standard
            let dictionary:NSMutableDictionary = NSMutableDictionary.init()
            let vcMain     = ViewController()
            let navVC      = UINavigationController.init(rootViewController: vcMain)
            let hostArray  = hostString?.components(separatedBy: "&")
            
            for hostItem:String in hostArray! {
                let itemArray = hostItem.components(separatedBy: "=")
                let itemKey   = itemArray[0]
                let itemValue = itemArray[1]
                dictionary.setValue(itemValue, forKey: itemKey)
                user.setValue(itemValue, forKey: itemKey)
                
            }
            
            self.window = UIWindow.init(frame: UIScreen.main.bounds)
            self.window?.backgroundColor = UIColor.clear
            self.window?.rootViewController = navVC
            self.window?.makeKeyAndVisible()
        }
        return true
    }
    
    
    
    
    
    
/*****************************************************************************/
   func launchOptionWithUrlIsNotEmpty(launchOptions:[UIApplicationLaunchOptionsKey: Any]?) ->Bool
    {
        let user = UserDefaults.standard
        user.removeObject(forKey: "userId")
        user.removeObject(forKey: "accesstoken")
        
        if  (launchOptions?[UIApplicationLaunchOptionsKey.url] as! NSURL?) != nil{
            state_URL = true
            let alertVC = UIViewController.init()
            alertVC.view.backgroundColor = UIColor.white
            self.window?.rootViewController = alertVC
            self.window?.makeKeyAndVisible()
            
            let alertControl = UIAlertController.init(title: "", message: "不能直接打开本程序，需要从警信平台打开", preferredStyle: UIAlertControllerStyle.alert)
            let alertAction  = UIAlertAction.init(title: "确定", style: UIAlertActionStyle.default) { (alert: UIAlertAction) in
                exit(0)
            }
            alertControl.addAction(alertAction)
            alertVC.present(alertControl, animated: true, completion: nil)
            
        }
        return state_URL
    }


}

