//
//  ViewController.swift
//  CampusCircle_ios_client
//
//  Created by jwq on 15/6/29.
//  Copyright (c) 2015年 panther-polaris. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    let url=""//在此设置服务器的地址

    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var PassWord: UITextField!
    @IBAction func submit(sender: UIButton) {
        checkUserName()
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
        var result:Bool = false
        var username:String = UserName.text
        Alamofire.request(.GET, url+"", parameters: ["username": username]).responseJSON() {
            (_, _, dataFromNetwork, _) in
            println(dataFromNetwork)
            if (dataFromNetwork != nil){
                let json = JSON(dataFromNetwork!)
                let state = json[0]["state"]
                result = state.bool!
            }else{
            println("通讯故障")
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

