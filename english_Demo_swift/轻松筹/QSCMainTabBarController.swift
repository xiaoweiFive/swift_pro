//
//  QSCMainTabBarController.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/4/20.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit

class QSCMainTabBarController: UITabBarController,QSCTabBarDelegate {

    
    var _customTabbar:QSCTabBar? = nil
    let imageView:UIImageView? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addTabbar()
        self.addAllChildViewControllers()

        UITabBar.appearance().shadowImage = UIImage()
        let babBarBackground = UIImage.createImageWithColor(color: zzwColor(red: 255, green: 255, blue: 255, alpha: 1))
        UITabBar.appearance() .backgroundImage = babBarBackground
        UITabBar.appearance() .selectionIndicatorImage = babBarBackground
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.removeTabBarButton()


    }
    
    func removeTabBarButton() {
        for item:UIView in self.tabBar.subviews {
            
            if item.isKind(of: NSClassFromString("UITabBarButton").self!) {
                item.removeFromSuperview()
            }
        }
    }
    
    func addTabbar() {
        let customTabbar = QSCTabBar(frame: self.tabBar.bounds)
        customTabbar.delegate = self
        self.tabBar.addSubview(customTabbar)
        _customTabbar = customTabbar
    }
    
    func addAllChildViewControllers() {
        let essenceVC1  = ZZWHomeNavigationViewController()
        self.addChildviewControllerAndItemInfo(child: essenceVC1, title: "首页", image: "tabbar_video_icon_normal", selectedImage: "tabbar_video_icon_selected")

        let essenceVC2  = ZZWHomeNavigationViewController()
        self.addChildviewControllerAndItemInfo(child: essenceVC2, title: "首页", image: "tabbar_video_icon_normal", selectedImage: "tabbar_video_icon_selected")
        
        let essenceVC3  = ZZWHomeNavigationViewController()
        self.addChildviewControllerAndItemInfo(child: essenceVC3, title: "首页", image: "tabbar_video_icon_normal", selectedImage: "tabbar_video_icon_selected")
        
        let essenceVC4  = ZZWHomeNavigationViewController()
        self.addChildviewControllerAndItemInfo(child: essenceVC4, title: "首页", image: "tabbar_video_icon_normal", selectedImage: "tabbar_video_icon_selected")
        
        let essenceVC5  = ZZWHomeNavigationViewController()
        self.addChildviewControllerAndItemInfo(child: essenceVC5, title: "首页", image: "tabbar_video_icon_normal", selectedImage: "tabbar_video_icon_selected")
        
    }
    
    
    func  addChildviewControllerAndItemInfo(child:UIViewController, title:String, image:String, selectedImage:String) {
        child.tabBarItem.image = UIImage.init(named: image)
        child.tabBarItem.selectedImage = UIImage.init(named: selectedImage)
        child.title = title
        
        let nav =  ZZWNavigationViewController(rootViewController: child)
        self.addChildViewController(nav)
        _customTabbar?.addTabBarButtonWithItem(item: child.tabBarItem)
        
    }
    
    func setTabBarSelectedCustomItem(customItemIndex:NSInteger) {
        if (_customTabbar != nil) {
            _customTabbar?.setSelectedBarButton(barButtonIndex: customItemIndex)
        }
    }
    
    func tabBarDidSelectButtonFrom(tabbar:QSCTabBar , from:Int , to:Int){
        
        if to == 2 {
            self.selectedIndex = from
        }else{
            if (from == to) {
                return;
            }
            
            self.selectedIndex = to;
            
        }
        
    }
    
    func tabBarDidDoubleSelectButtonFrom(tabbar:QSCTabBar , from:Int , to:Int){
        //双击首页 －－－ 置顶
    }


}


//extension QSCMainTabBarController:QSCTabBarDelegate{
//    
//    }
//

