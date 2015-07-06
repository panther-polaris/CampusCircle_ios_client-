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

    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var PassWord: UITextField!
    //@IBAction func submit(sender: UIButton) {
    //    println("a")
    //           }
    @IBAction func loginbtn(sender: AnyObject) {
        checkUserName()
        /*
        self.performSegueWithIdentifier("login", sender: self)
        
        var ReturnFrist: Bool = checkUserName()
        if (ReturnFrist){
            if checkLogin(){
        
            }else{
                println("密码错误")
            }
        }else{
            println("用户名不存在")
        }
        */
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

        var state:Bool = false
        var username:String = UserName.text
        Alamofire.request(.GET, url+"/a.php", parameters: ["username":username]).responseJSON() {
            (_, _, dataFromNetwork, _) in
            //println(dataFromNetwork)
            if (dataFromNetwork != nil){
                let json = JSON(dataFromNetwork!)
                state = Bool(json["state"])
                println(state)                //true
            }else{
                println("通讯故障")
            }
        }
        //println(state)
        return state
    }
    func checkLogin()->Bool{
        
        var state:Bool = false
        var Login: String = safety.LoginEncryption(PassWord.text)

        Alamofire.request(.GET, url+"/a.php", parameters: ["username":Login]).responseJSON() {
            (_, _, dataFromNetwork, _) in
            if (dataFromNetwork != nil){
                let json = JSON(dataFromNetwork!)
                let state = Bool(json["state"])
            }else{
                println("通讯故障")
            }
        }
        return state
    }

}

