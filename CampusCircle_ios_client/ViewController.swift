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
var data_transmission = Data_transmission()
var data_prcessing = Data_processing()
var safety = Safety()
let url = "http://10.10.10.73"   //在此设置服务器的地址
class ViewController: UIViewController{

    //@IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var UserName: UITextField!
    //(textField.placeholder="请输入用户名")
    @IBOutlet weak var PassWord: UITextField!
    //@IBAction func submit(sender: UIButton) {
    //    println("a")
    //           }
    @IBAction func loginbtn(sender: AnyObject) {
        checkLogin()
        
        self.performSegueWithIdentifier("login", sender: self)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func checkLogin()->Bool{
        var state:Bool = false
        var username:String = UserName.text
        var Password_Time_md5: String = safety.LoginEncryption(PassWord.text)
        var UserMessage:String = username + "&" + Password_Time_md5
        println()
        Alamofire.request(.GET, url+"/test.php", parameters: ["usermessage":UserMessage]).responseJSON() {
            (_, _, dataFromNetwork, _) in
            println(dataFromNetwork)
            if (dataFromNetwork != nil){
                let json = JSON(dataFromNetwork!)
                let state = json["state"]
            }else{
                println("通讯故障")
            }
        }
        return state
    }
}



