//
//  Safety.swift
//  CampusCircle_ios_client
//
//  Created by bp on 15/7/5.
//  Copyright (c) 2015年 panther-polaris. All rights reserved.
//

import UIKit

class Safety: NSObject {
    
    func TimeStamp() ->NSTimeInterval{
        var timeInterval:NSTimeInterval = 0
        timeInterval = NSDate().timeIntervalSince1970
        
        return timeInterval
    }
    //
    /*
    该方法实现将密码进行MD5加密
    使用方法事例：
    var returnPassword = Data_transmission()
    returnPassword.checkPassWord(PassWord.text)
    */
    //func PassWord_md5(PassWord: String)->Bool{
    //    var result:Bool
    //    result = true
    //    var password_md5:String = PassWord.md5()
    //    return result
    //}
    
    /*
    该方法实现将密码进行MD5加密
    使用方法事例：
    var returnPassword = Data_transmission()
    returnPassword.checkPassWord(PassWord.text)
    */
    func LoginEncryption(PassWord: String)-> String{
        var timestamp: Int,timestamps: Int
        timestamp =  Int(TimeStamp())
        timestamps = timestamp / 120
        var userlogin: String = PassWord.md5() + String(timestamps)
        var userlogin_md5: String = userlogin.md5()
        userlogin_md5 = userlogin.md5()
        return userlogin_md5
    }
}
/*
该方法实现将密码与时间戳拼接并进行MD5加密
*/
extension String{
    func md5() ->String!{
        let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
        let strLen = CUnsignedInt(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
        CC_MD5(str!, strLen, result)
        var hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        result.destroy()
        return String(format: hash as String)
    }
}