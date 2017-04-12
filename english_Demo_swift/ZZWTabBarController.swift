//
//  ZZWTabBarController.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/1/3.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit

class ZZWTabBarController: UITabBarController{
    
    let tabbar = ZZWTabBar()
    var lastSelectedIndex:NSInteger = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabbar.tabBarDelegate = self
        setValue(tabbar, forKey: "tabBar")
        tabbar.tintColor = COLOR_NAV_BG
        setMyVC()
    }

    
    fileprivate func setMyVC(){
        let essenceVC1  = ZZWHomeNavigationViewController()
        configChildViewController(childViewController: essenceVC1, title: "首页", imageName: "tabbar_video_icon_normal", selectedImage: "tabbar_video_icon_selected")
        
        let essenceVC2  = ZZWFireViewController()
        
        configChildViewController(childViewController: essenceVC2, title: "热点", imageName: "tabbar_video_icon_normal", selectedImage: "tabbar_video_icon_selected")
        
        let essenceVC3  = ZZWZhiBoViewController()

        configChildViewController(childViewController: essenceVC3, title: "直播", imageName: "tabbar_video_icon_normal", selectedImage: "tabbar_video_icon_selected")
        
        let essenceVC4  = ZZWFaQiProjectVC()

        configChildViewController(childViewController: essenceVC4, title: "个人中心", imageName: "tabbar_video_icon_normal", selectedImage: "tabbar_video_icon_selected")
        // 布局完立马选中，防止崩溃
        selectedIndex = 0
        self.delegate = self
    }
    
    
    fileprivate func configChildViewController(childViewController:UIViewController,title:String,imageName:String, selectedImage:String){
        childViewController.title = title
        childViewController.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        childViewController.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
        childViewController.tabBarItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 12)], for: .normal)
        childViewController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
        let navigaitonVC = ZZWNavigationViewController(rootViewController: childViewController)
        addChildViewController(navigaitonVC)
    }
    
    
    fileprivate  func presentLoginVc()  {
        let login = ZZWNavigationViewController(rootViewController: ZZWLoginViewController())
        present(login, animated: true, completion: nil)
    }
}


extension ZZWTabBarController:UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        print(ZZWAccountTool.share.account?.userName ?? "11111111111111")

        
        if (selectedIndex == 1 || selectedIndex == 2 || selectedIndex == 3  ) && !ZZWAccountTool.share.ZZWIsLogin() {
            presentLoginVc()
            selectedIndex = lastSelectedIndex
            return;
        }
        lastSelectedIndex = selectedIndex;
    }
}

extension ZZWTabBarController:ZZWTabBarDelegate{
    func didTappedAddButton() {
        print("-=-=-=-=-=-=-=-=-=-=-=")
    }
}
