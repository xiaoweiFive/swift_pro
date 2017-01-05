//
//  ZZWLoginViewController.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/1/5.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit

class ZZWLoginViewController: UIViewController {
    
    var account = ZZWAcconut()

    @IBOutlet weak var userNameTextFiled: UITextField!
    
    @IBOutlet weak var userPassWordTextFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        

        let userDefault = UserDefaults.standard
        //自定义对象存储
        let model = userInfo(name: "航歌", phone: "3525")
        //实例对象转换成Data
        let modelData = NSKeyedArchiver.archivedData(withRootObject: model)
        //存储Data对象
        userDefault.set(modelData, forKey: "myModel")
    }
    
    
    @IBAction func loginClick(_ sender: Any) {
        
        self.account.userName = userNameTextFiled.text
        ZZWAccountTool.share.saveAccount(account: self.account)
        ZZWAccountTool.share.account = self.account

        back("")
        
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
