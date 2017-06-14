//
//  BQRouter.swift
//  Router-modular-demo
//
//  Created by baiqiang on 2017/6/10.
//  Copyright © 2017年 baiqiang. All rights reserved.
//

import UIKit

extension UIViewController {
    func loadVcInfo(params:Dictionary<String,Any>) {}
}

struct BQRouter {
    static func loadVc(vcName:String, spaceName: String? = nil) -> UIViewController {
        var clsName = ""
        if let space = spaceName{
            clsName = space + "." + vcName
        }else {
            let spaceName = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String
            clsName = spaceName! + "." + vcName
        }
        let cls = NSClassFromString(clsName) as? UIViewController.Type
        let vc = cls?.init()
        if let valueVc = vc {
            return valueVc
        }else {
            return ErrorVc() 
        }
    }
}

