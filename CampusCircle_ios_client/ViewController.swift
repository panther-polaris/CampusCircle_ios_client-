//
//  ViewController.swift
//  CampusCircle_ios_client
//
//  Created by jwq on 15/6/29.
//  Copyright (c) 2015年 panther-polaris. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    let url=""//在此设置服务器的地址

    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var PassWord: UITextField!
    @IBAction func submit(sender: UIButton) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func checkUserName()->Bool{
        var result:Bool
        result = true
        var username:String = UserName.text
        Alamofire.request(.GET, url+"", parameters: ["username": username]).responseJSON() {
            (_, _, JSON, _) in
            println(JSON)
            if JSON != nil{
            
            }
        }
        return result
    
    }
    func checkPassWord()->Bool{
        var result:Bool
        result = true
        var password_md5:String = PassWord.text.md5()
        return result
    
    }


}

