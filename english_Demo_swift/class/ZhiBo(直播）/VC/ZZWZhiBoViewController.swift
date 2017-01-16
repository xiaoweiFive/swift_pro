//
//  ZZWZhiBoViewController.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/1/16.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit

class ZZWZhiBoViewController: UIViewController {
    
    let headSegmentArray = ["推荐","最新","热门","礼物","美食","生活","设计感","家居","数码","阅读","学生党","上班族","美妆","护理","运动户外","健康"]

    var vcArray = Array<UIViewController>()
    var tableViewArray = Array<UITableView>()
    var currentTableView = UITableView()
    var lastTableViewOffsetY = CGFloat()
    var imageModelArray = Array<ZZWBannerModel>()

    lazy var headSegmentView:ZZWHeadSegmentView = {
        let headSeg = ZZWHeadSegmentView.init(frame: CGRect(x: 0, y: 200, width: SCREEN_WIDTH, height: 40))
        headSeg.delegate = self
        return headSeg
        
    }()
    
    
    lazy var bottomScroll:UIScrollView = {
       let scroll = UIScrollView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.isPagingEnabled = true
        scroll.delegate = self

        for i in 0...self.headSegmentArray.count-1{
            let segVC = ZZWSegmentViewController()
            segVC.view.backgroundColor = UIColor.randomColor()
            segVC.view.frame = CGRect.init(x: SCREEN_WIDTH * CGFloat(i), y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
            scroll.addSubview(segVC.view)
//            self.vcArray.append(segVC)
            self.tableViewArray.append(segVC.tableView)
            
            segVC.tableView.addObserver(self, forKeyPath: "contentOffset", options: NSKeyValueObservingOptions.new, context: nil)
        }
        
        scroll.contentSize = CGSize.init(width: CGFloat(self.headSegmentArray.count) * SCREEN_WIDTH, height: SCREEN_HEIGHT)
        
        return scroll
    
    }()
    
    lazy var headScrollView: ZZWBannerScrollView = {
        let headScroll = ZZWBannerScrollView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 200))
        headScroll.delegate = self
        return headScroll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        self.view.addSubview(self.bottomScroll)
        self.view.addSubview(self.headSegmentView)
        self.view.addSubview(self.headScrollView)

         let titleArray = ["推荐","最新","热门","礼物","美食","生活","设计感","家居","数码","阅读","学生党","上班族","美妆","护理","运动户外","健康"]
        self.headSegmentView.sendData(array: titleArray)
        getScrollImage()


    }
    
    
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
    

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        let tableView = object as! UITableView
        
        if !(keyPath == "contentOffset") {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
            return
        }
        
        let tableViewoffsetY = tableView.contentOffset.y
        
        self.lastTableViewOffsetY = tableViewoffsetY
        
        if ( tableViewoffsetY >= 0 && tableViewoffsetY <= 136) {
            self.headSegmentView.frame = CGRect.init(x: 0, y: 200-tableViewoffsetY, width: SCREEN_WIDTH, height: 40)
//            self.headScrollView.frame = CGRect.init(x: 0, y: 0-tableViewoffsetY, width: SCREEN_WIDTH, height: 200);
            
        }else if( tableViewoffsetY < 0){
            self.headSegmentView.frame = CGRect.init(x: 0, y: 200, width: SCREEN_WIDTH, height:40);
//            self.headScrollView.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 200);
            
        }else if (tableViewoffsetY > 136){
            self.headSegmentView.frame = CGRect.init(x: 0, y: 64, width: SCREEN_WIDTH, height:40);
//            self.headScrollView.frame = CGRect.init(x: 0, y: -136, width: SCREEN_WIDTH, height: 200);
        }
        
    }
    
    

}


extension ZZWZhiBoViewController:HeadSegmentViewDelegate{
    func clickSegment(index: NSInteger) {
        self.currentTableView = self.tableViewArray[0]
        for table:UITableView in self.tableViewArray {
            if (self.lastTableViewOffsetY >= 0 && self.lastTableViewOffsetY <= 136) {
                table.contentOffset = CGPoint.init(x: 0, y: self.lastTableViewOffsetY)
            }else if(self.lastTableViewOffsetY < 0){
                table.contentOffset = CGPoint.init(x: 0, y: 0)
            }else{
                table.contentOffset = CGPoint.init(x: 0, y: 136)
            }
        }
    }
}



extension ZZWZhiBoViewController:UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        self.headSegmentView.getIndex(index: Int(scrollView.contentOffset.x / SCREEN_WIDTH))
        
        self.currentTableView = self.tableViewArray[Int(scrollView.contentOffset.x / SCREEN_WIDTH)]
        
        for table: UITableView in self.tableViewArray {
            if ( self.lastTableViewOffsetY>=0 &&  self.lastTableViewOffsetY<=136) {
                table.contentOffset = CGPoint.init(x: 0, y: self.lastTableViewOffsetY)
                
            }else if(  self.lastTableViewOffsetY < 0){
                table.contentOffset = CGPoint.init(x: 0, y: 0)
                
            }else if ( self.lastTableViewOffsetY > 136){
                table.contentOffset = CGPoint.init(x: 0, y: 136)
            }
            
        }
        
        
    }
}


extension ZZWZhiBoViewController:clickBannerDelegate{
    func clickBannerToDo(index:Int){
        print("123234324234234234")
        let model:ZZWBannerModel = self.imageModelArray[index] as ZZWBannerModel;
        
    }
}
