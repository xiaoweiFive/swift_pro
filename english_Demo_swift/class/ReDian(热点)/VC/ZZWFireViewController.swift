//
//  ZZWFireViewController.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/1/10.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit

class ZZWFireViewController: UIViewController {

    
    var imageModelArray = Array<ZZWBannerModel>()
//    var title = Array<String>()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.headScrollView)

        getScrollImage()

        // Do any additional setup after loading the view.
    }

    lazy var headScrollView: ZZWBannerScrollView = {
        let headScroll = ZZWBannerScrollView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 200))
        headScroll.delegate = self
        return headScroll
    }()
    
    
    func getScrollImage() {
        
        let para = ["app_id":"com.jzyd.BanTang",
                    "app_installtime":"1482905598",
                    "app_versions":"5.9.5",
                    "channel_name":"appStore",
                    "client_id":"bt_app_ios",
                    "client_secret":"9c1e6634ce1c5098e056628cd66a17a5",
                    "oauth_token":"4150e754a624ecdc255ad1d13f6287bc",
                    //"last_get_time":"1463238932",
            
            "os_versions":"10.2",
            "screensize":"750",
            "track_device_info":"iPhone8,4",
            "track_device_uuid":"DE964894-8C6F-48BF-9F6C-A47167353EAC",
            "track_deviceid":"BAEA9AD2-16E3-4D12-8E28-4EB9F15A1412",
            "track_user_id":"2777434",
            "v":"24",
            "page":"0",
            "pagesize":"20"
        ]

        
        
        ZZWHttpTools.share.getWithPath(path: "http://open3.bantangapp.com/recommend/operationElement?", parameters: para, success: { (json) in
            
            print(json)
            
            let imageArray = json["data"]["banner"].arrayObject as! [[String : AnyObject]]
            
            for dict in imageArray{
                let imageModel = ZZWBannerModel().mj_setKeyValues(dict)
                self.imageModelArray.append(imageModel!)
            }
            self.headScrollView.getScrollImgSource(source: self.imageModelArray)
            
        }) { (error) in
            print(error)
        }
        
        
        print("1111111111")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


extension ZZWFireViewController:clickBannerDelegate{
    func clickBannerToDo(index:Int){
     print("123234324234234234")
        let model:ZZWBannerModel = self.imageModelArray[index] as ZZWBannerModel;
       
    }
    
}
