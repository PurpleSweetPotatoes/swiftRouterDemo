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
    //MARK: - ***** private Method *****
    private func initData() {
        
    }
    private func initUI() {
        
    }
    private func registerNotify() {
        NotificationCenter.default.addObserver(self, selector: #selector(loginSuccess(notifi:)), name: .RLoginSucess, object: nil)
    }
    //MARK: - ***** LoadData Method *****
    
    //MARK: - ***** respond event Method *****
    @objc private func loginSuccess(notifi:Notification) {
        print(notifi.name)
        self.navigationItem.title = notifi.object as? String
    }
    //MARK: - ***** Protocol *****
    override func loadVcInfo(params: Dictionary<String, Any>) {
        self.navigationItem.title = params["title"] as? String
    }

    //MARK: - ***** create Method *****

}
