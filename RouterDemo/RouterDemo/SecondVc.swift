//
//  SecondVc.swift
//  RouterDemo
//
//  Created by baiqiang on 2017/6/11.
//  Copyright © 2017年 baiqiang. All rights reserved.
//

import UIKit

class SecondVc: BaseVc {

    //MARK: - ***** Ivars *****
    
    //MARK: - ***** Class Method *****
    
    //MARK: - ***** initialize Method *****
    
    //MARK: - ***** Lifecycle *****
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initData()
        self.initUI()
        self.registerNotify()
    }
    
    //MARK: - ***** public Method *****
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = BQRouter.loadVc(vcName: "ThreeVc")
        vc.loadVcInfo(params:["title":"three"])
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func loadVcInfo(params: Any) {
        let para = params as? Dictionary<String, Any>
        self.navigationItem.title = para?["title"] as? String
    }
    override func reciveRouterComm(name: Notification.Name, params: Any?) {
        if name == .RLoginSucess {
            print("\(self.classForCoder) 登录成功 回调 \(params ?? "无参数")")
        }else if name == .RLogout {
            print("\(self.classForCoder) 退出登录 回调 \(params ?? "无参数")")
        }
    }
    //MARK: - ***** private Method *****
    private func initData() {
        
    }
    private func initUI() {
        
    }
    private func registerNotify() {
        BQRouterComm.addRouterComm(names: .RLogout, .RLoginSucess, target: self)
    }
    //MARK: - ***** LoadData Method *****
    
    //MARK: - ***** respond event Method *****
    @objc private func loginSuccess(notifi:Notification) {
        print(notifi.name)
        self.navigationItem.title = notifi.object as? String
    }
    //MARK: - ***** Protocol *****
    
    //MARK: - ***** create Method *****

}
