//
//  BQRouterComm.swift
//  Router-modular-demo
//
//  Created by baiqiang on 2017/6/29.
//  Copyright © 2017年 baiqiang. All rights reserved.
//

import UIKit

class BaseVcProxy: NSObject {
    weak var vc:BQBaseVc?
    var notifiArr:[Notification.Name] = []
    init(vc: BQBaseVc) {
        self.vc = vc
        super.init()
    }
}

class BQRouterComm {
    static let share = BQRouterComm()
    private var actionObjc:[BaseVcProxy] = []
    
    public func addRouterAction(names:Notification.Name..., target: BQBaseVc) {
        for weakVc in self.actionObjc {
            if let vc = weakVc.vc {
                if vc == target {
                    return
                }
            }
        }
        let weakVc = BaseVcProxy(vc: target)
        weakVc.notifiArr.append(contentsOf: names)
        self.actionObjc.append(weakVc)
    }
    
    public func postRouterAction(name:Notification.Name, params:Dictionary<String,Any>?) {
        for weakVc in self.actionObjc {
            if let vc = weakVc.vc {
                if weakVc.notifiArr.contains(name) {
                    vc.reciveRouterComm(name: name, params: params)
                }
            }
        }
    }
    public func clearRouterAction() {
        var removeArr:[Int] = []
        var index = 0
        for weakVc in self.actionObjc {
            if weakVc.vc == nil {
                removeArr.append(index)
            }
            index += 1
        }
        for i in removeArr {
            self.actionObjc.remove(at: i)
        }
        print(self.actionObjc)
    }
    private init() {
        
    }
}
