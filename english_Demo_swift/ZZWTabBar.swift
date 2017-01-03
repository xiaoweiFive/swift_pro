//
//  ZZWTabBar.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/1/3.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit

protocol ZZWTabBarDelegate:NSObjectProtocol {
    func didTappedAddButton()
}


class ZZWTabBar: UITabBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
        shadowImage = UIImage()
        addSubview(addButton)
    }
    
    weak var tabBarDelegate:ZZWTabBarDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let y:CGFloat = 0;
        let width:CGFloat = SCREEN_WIDTH/5
        let height:CGFloat = 49
        var index = 0
        for view in subviews {
            if !view.isKind(of: NSClassFromString("UITabBarButton")!) {
                if view.isKind(of: NSClassFromString("UIImageView")!) && view.bounds.size.height<=1 {
                    view.isHidden = true
                }
                continue
            }
            let x = CGFloat(index>1 ? index+1 : index)*width
            view.frame = CGRect(x: x, y: y, width: width, height: height)
            index += 1
        }
    }
    
    /**
     处理tabBar子控件的事件响应
     */
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if self.isHidden == false {
            let newPoint =  self.convert(point, to: addButton)
            if addButton.point(inside: newPoint, with: event) {
                return addButton
            }else{
                return super.hitTest(point, with: event)
            }
        }
        return super.hitTest(point, with: event)
    }
    
    
    lazy var addButton:UIButton = {
       let addButton = UIButton(type: .custom)
        addButton.setImage(UIImage(named: "tabbar_publish_icon_normal"), for: UIControlState())
        addButton.setImage(UIImage(named: "tabbar_publish_icon_selected"), for: .highlighted)

        addButton.size = CGSize(width: SCREEN_WIDTH / 5, height: SCREEN_WIDTH / 5)
        addButton.center = CGPoint(x: SCREEN_WIDTH * 0.5, y: 49 * 0.5 - 10)
        addButton.addTarget(self, action: #selector(didTappedAddButton(_:)), for: .touchUpInside)
        return addButton;
    }()
    
    @objc fileprivate func didTappedAddButton(_ button:UIButton){
        tabBarDelegate?.didTappedAddButton()
    }

}
