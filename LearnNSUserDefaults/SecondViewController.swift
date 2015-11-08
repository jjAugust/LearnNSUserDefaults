//
//  SecondViewController.swift
//  LearnNSUserDefaults
//
//  Created by 任 一杰 on 15/11/7.
//  Copyright © 2015年 任一杰. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var userNmae: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var rembSwich: UISwitch!
    
    
    
    override func viewDidLoad() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(sender: UIButton) {

        //读取上次配置
        self.userNmae.text =
            NSUserDefaults.standardUserDefaults().valueForKey("UserName") as! String!
        self.password.text = NSUserDefaults.standardUserDefaults().valueForKey("password")as! String!
        self.rembSwich.on = NSUserDefaults.standardUserDefaults().boolForKey("RmbPwdKey") as Bool!
        if (self.rembSwich.on){
            self.password.text = NSUserDefaults.standardUserDefaults().valueForKey("PwdKey") as! String!
        }
        
        NSUserDefaults.standardUserDefaults().setObject(self.userNmae.text, forKey: "UserName")
        NSUserDefaults.standardUserDefaults().setObject(self.password.text, forKey: "password")
        NSUserDefaults.standardUserDefaults().setBool(self.rembSwich.on, forKey: "RmbPwdKey")
        //设置同步
        NSUserDefaults.standardUserDefaults().synchronize()
        
       // 读取上次配置
        self.userNmae.text =
            NSUserDefaults.standardUserDefaults().valueForKey("UserName") as! String!
        self.password.text = NSUserDefaults.standardUserDefaults().valueForKey("password")as! String!
        self.rembSwich.on = NSUserDefaults.standardUserDefaults().boolForKey("RmbPwdKey") as Bool!
        if (self.rembSwich.on){
            self.password.text = NSUserDefaults.standardUserDefaults().valueForKey("PwdKey") as! String!
        }
        
    }
    

    @IBAction func textFieldDoneEditing(sender : UITextField){
        sender.resignFirstResponder()
    }
}

