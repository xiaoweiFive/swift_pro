//
//  ZZWNavigationViewController.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/1/3.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit

class ZZWNavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navBar = navigationBar
        navBar.barTintColor = COLOR_NAV_BG
        navBar.isTranslucent = false
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()

        //导航栏背景色
        navigationBar.titleTextAttributes = [NSFontAttributeName : UIFont.systemFont(ofSize: 18),NSForegroundColorAttributeName:COLOR_NAV_ITEM_NORMAL]
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count>0 {
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.itemWithTarget(target: self, action: #selector(didTappedBackButton), icon: "top_navigation_back_normal", highlightedIcon: "top_navigation_back_normal")
            viewController.hidesBottomBarWhenPushed = true
        }else{
            viewController.hidesBottomBarWhenPushed = false
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func didTappedBackButton()  {
        popViewController(animated: true)
    }
}
