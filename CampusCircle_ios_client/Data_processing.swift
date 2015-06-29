//
//  Data_processing.swift
//  CampusCircle_ios_client
//
//  Created by jwq on 15/6/29.
//  Copyright (c) 2015年 panther-polaris. All rights reserved.
//该类用于做数据处理

import UIKit

class Data_processing: NSObject {
    
}
/*
该方法实现将字符串做MD5哈希处理
使用方法事例：
var i="aaaa"
var i_md5 = i.md5();
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
   

