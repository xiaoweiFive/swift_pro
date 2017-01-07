//
//  ZZWHomeViewController.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/1/3.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit

class ZZWHomeViewController: UIViewController {

    
    lazy var subiewTitles:[String] = {
        let array = ["综艺","电影","电视剧","NBA","快乐大本营","奔跑吧","傻脆歌","中国好声音"]
        return array
    }()
    
    lazy var VCManager:ZZWVCManagerView = {
       let manager = ZZWVCManagerView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 44))
        return manager
    }()
    
    
    lazy var pageManager:ZZWPageManagerVC = {
        let manager = ZZWPageManagerVC.init(superController: self, childControllers: [ZZWHomePageViewController(),ZZWHomePageViewController(),ZZWHomePageViewController(),ZZWHomePageViewController(),ZZWHomePageViewController(),ZZWHomePageViewController(),ZZWHomePageViewController(),ZZWHomePageViewController()])
       return manager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        VCManager.title_font = UIFont.systemFont(ofSize: 15)
        VCManager.silderWidthType = .BottomWidth
        VCManager.title_array = subiewTitles
        pageManager.view.frame = CGRect(x: 0, y: 44, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-44-49)
        
        VCManager.delegate = self
        pageManager.delegate = self
        view.addSubview(VCManager)
        view.addSubview(pageManager.view)
    }
}

extension ZZWHomeViewController:VCManagerDelegate,PageManagerVC_Delegate{
    func VCMangerDidSelected(_ VCManager:ZZWVCManagerView , index:NSInteger , title:String) {
        pageManager.setCurrentVCWithIndex(index)
    }
    func PageManagerDidFinishSeletedVc(indexOfVC: NSInteger) {
        VCManager.reloadSelectedBT(at: indexOfVC)
    }
}
