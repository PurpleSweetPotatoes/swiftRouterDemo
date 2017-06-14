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
    //MARK: - ***** private Method *****
    private func initData() {
        self.navigationItem.title = "first"
    }
    private func initUI() {
        self.label = UILabel(frame: CGRect(x: 50, y: 100, width: 200, height: 30))
        self.view.addSubview(self.label)
    }
    private func registerNotify() {
        NotificationCenter.default.addObserver(self, selector: #selector(loginSuccess(notifi:)), name: .RLoginSucess, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(loginSuccess(notifi:)), name: .RLogout, object: nil)
    }
    
    //MARK: - ***** LoadData Method *****
    
    //MARK: - ***** respond event Method *****
    @objc private func loginSuccess(notifi:Notification) {
        print(notifi.name)
        self.label.text = notifi.object as? String
    }
    //MARK: - ***** Protocol *****
    override func loadVcInfo(params: Dictionary<String, Any>) {
        self.navigationItem.title = params["title"] as? String
    }
    //MARK: - ***** create Method *****

}

