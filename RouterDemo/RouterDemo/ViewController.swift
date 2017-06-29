//
//  ViewController.swift
//  RouterDemo
//
//  Created by baiqiang on 2017/6/11.
//  Copyright © 2017年 baiqiang. All rights reserved.
//

import UIKit

class ViewController: BaseVc {
    
    //MARK: - ***** Ivars *****
    private var label: UILabel!
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
        let vc = BQRouter.loadVc(vcName: "SecondVc")
        vc.loadVcInfo(params:["title":"second"])
        self.navigationController?.pushViewController(vc, animated: true)
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
        self.navigationItem.title = "first"
    }
    private func initUI() {
        self.label = UILabel(frame: CGRect(x: 50, y: 100, width: 200, height: 30))
        self.view.addSubview(self.label)
    }
    private func registerNotify() {
        BQRouterComm.addRouterComm(names: .RLoginSucess,.RLogout, target: self)
    }
    
    //MARK: - ***** LoadData Method *****
    
    //MARK: - ***** respond event Method *****
    @objc private func loginSuccess(notifi:Notification) {
        print(notifi.name)
        self.label.text = notifi.object as? String
    }
    //MARK: - ***** Protocol *****

    //MARK: - ***** create Method *****

}

