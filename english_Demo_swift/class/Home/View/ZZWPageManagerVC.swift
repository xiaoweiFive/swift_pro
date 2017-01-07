//
//  ZZWPageManagerVC.swift
//  english_Demo_swift
//
//  Created by 张振伟 on 17/1/7.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit


protocol PageManagerVC_Delegate:NSObjectProtocol {
    func PageManagerDidFinishSeletedVc(indexOfVC:NSInteger)
}

class ZZWPageManagerVC: UIViewController {
    //代理
    weak var delegate:PageManagerVC_Delegate?
    //控制器数组
    fileprivate var childControllerS:[UIViewController] = [UIViewController]()
    //父控制器
    fileprivate var superController:UIViewController!
    //分页控制器
    fileprivate var pageVC:UIPageViewController!
    
    init(superController:UIViewController,childControllers:[UIViewController]){
        super.init(nibName: nil, bundle: nil)
        self.superController = superController;
        self.childControllerS = childControllers
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    
    
    
  fileprivate  func setUpUI()  {
    if childControllerS.count == 0 {
        return
    }
    let temp_pageVC = UIPageViewController.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    temp_pageVC.delegate = self
    temp_pageVC.dataSource = self
    temp_pageVC.setViewControllers([childControllerS.first!], direction: .forward, animated: false, completion: nil)
    temp_pageVC.view.frame = view.frame
    pageVC = temp_pageVC
    self.view.addSubview(temp_pageVC.view)
    
    }
    
    
    //设置当前显示控制器
    func setCurrentVCWithIndex(_ index:NSInteger) {
        
        if index < 0 || index > childControllerS.count - 1 {
            return
        }
        pageVC.setViewControllers([childControllerS[index]], direction: .forward, animated: false, completion: nil)
    }
    

}
//pageViewControllerDelegate、DataSource
extension ZZWPageManagerVC:UIPageViewControllerDelegate,UIPageViewControllerDataSource{
    //设置上一个控制器
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = childControllerS.index(of: viewController) else {return nil}
        if index == 0 || index == NSNotFound {return nil}
        return childControllerS[index - 1]
    }
    //设置下一个控制器
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = childControllerS.index(of: viewController)else{return nil}
        if index == NSNotFound || index == childControllerS.count - 1{return nil}
        return childControllerS[index + 1]
    }
    //设置控制器数量
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return childControllerS.count
    }
    
    
    //当控制器完成显示后调用
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let temp_vc = pageViewController.viewControllers?[0] else {return}
        let index = childControllerS.index(of: temp_vc)!
        self.delegate?.PageManagerDidFinishSeletedVc(indexOfVC: index)
    }
    
    
}



