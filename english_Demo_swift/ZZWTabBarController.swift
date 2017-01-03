//
//  ZZWTabBarController.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/1/3.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit

class ZZWTabBarController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tabbar = ZZWTabBar()
        tabbar.tabBarDelegate = self
        setValue(tabbar, forKey: "tabBar")
        tabbar.tintColor = COLOR_NAV_BG
        setMyVC()
    }

    
    fileprivate func setMyVC(){
        let essenceVC1  = ZZWHomeViewController()
        configChildViewController(childViewController: essenceVC1, title: "首页", imageName: "tabbar_video_icon_normal", selectedImage: "tabbar_video_icon_selected")
        
        let essenceVC2  = ZZWHomeViewController()
        
        configChildViewController(childViewController: essenceVC2, title: "首页", imageName: "tabbar_video_icon_normal", selectedImage: "tabbar_video_icon_selected")
        
        let essenceVC3  = ZZWHomeViewController()

        configChildViewController(childViewController: essenceVC3, title: "首页", imageName: "tabbar_video_icon_normal", selectedImage: "tabbar_video_icon_selected")
        
        let essenceVC4  = ZZWFaQiProjectVC()

        configChildViewController(childViewController: essenceVC4, title: "我", imageName: "tabbar_video_icon_normal", selectedImage: "tabbar_video_icon_selected")
        // 布局完立马选中，防止崩溃
        selectedIndex = 0
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

extension ZZWTabBarController:ZZWTabBarDelegate{
    func didTappedAddButton() {
        print("-=-=-=-=-=-=-=-=-=-=-=")
    }
}
