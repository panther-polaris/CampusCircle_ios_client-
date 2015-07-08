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

<<<<<<< HEAD
class ViewController: UIViewController {
    let url="10."//在此设置服务器的地址

=======
    //@IBOutlet weak var UserName: UITextField!
>>>>>>> 9ef56b0346c6af9584b80dcbbc74969cefd327ce
    @IBOutlet weak var UserName: UITextField!
    //(textField.placeholder="请输入用户名")
    @IBOutlet weak var PassWord: UITextField!
<<<<<<< HEAD
    @IBAction func submit(sender: UIButton) {
        checkUserName()
        checkPassWord()
=======
    //@IBAction func submit(sender: UIButton) {
    //    println("a")
    //           }
    @IBAction func loginbtn(sender: AnyObject) {
        checkLogin()
        
        self.performSegueWithIdentifier("login", sender: self)

>>>>>>> 9ef56b0346c6af9584b80dcbbc74969cefd327ce
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //////////////////////////////
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



/*
该方法实现将密码进行MD5加密
使用方法事例：
var returnPassword = Data_transmission()
returnPassword.checkPassWord(PassWord.text)
*/
func LoginEncryption(PassWord: String)-> String{
    var timestamp: Int,timestamp: Int
    timestamp = Int(TimeStamp())
    timestamp = timestamp / 120
    var userlogin: String = PassWord.md5() + String(times)
    var userlogin_md5: String = userlogin.md5()
    userlogin_md5 = userlogin.md5
    return userlogin_md5
}




