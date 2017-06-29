//
//  ThreeVc.swift
//  RouterDemo
//
//  Created by baiqiang on 2017/6/11.
//  Copyright © 2017年 baiqiang. All rights reserved.
//

import UIKit

class ThreeVc: BaseVc {

    //MARK: - ***** Ivars *****
    private var textField: UITextField!
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
        let vc  = BQRouter.loadVc(vcName: "unkown")
        vc.loadVcInfo(params:["title":"sencond"])
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func loadVcInfo(params: Any) {
        let para = params as? Dictionary<String, Any>
        self.navigationItem.title = para?["title"] as? String
    }
    //MARK: - ***** private Method *****
    private func initData() {
        
    }
    private func initUI() {
        self.textField = UITextField(frame: CGRect(x: 50, y: 100, width: 200, height: 40))
        self.textField.borderStyle = .roundedRect
        self.textField.placeholder = "回传内容"
        self.view.addSubview(self.textField)
        
        let inBtn = UIButton(type: .system)
        inBtn.frame = CGRect(x: 50, y: 200, width: 100, height: 40)
        inBtn.setTitle("login", for: .normal)
        inBtn.addTarget(self, action: #selector(logInAction), for: .touchUpInside)
        self.view.addSubview(inBtn)
        
        
        let outBtn = UIButton(type: .system)
        outBtn.frame = CGRect(x: 200, y: 200, width: 100, height: 40)
        outBtn.setTitle("logout", for: .normal)
        outBtn.addTarget(self, action: #selector(logOutAction), for: .touchUpInside)
        self.view.addSubview(outBtn)
    }
    private func registerNotify() {
        
    }
    //MARK: - ***** LoadData Method *****
    
    //MARK: - ***** respond event Method *****
    @objc private func logInAction() {
        BQRouterComm.postRouterComm(name: .RLoginSucess, params: self.textField.text!)
    }
    @objc private func logOutAction() {
        BQRouterComm.postRouterComm(name: .RLogout, params: self.textField.text!)
    }
    //MARK: - ***** Protocol *****
    
    //MARK: - ***** create Method *****

}
