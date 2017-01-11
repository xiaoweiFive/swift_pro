//
//  ZZWBannerScrollView.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/1/10.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit
import SDCycleScrollView

protocol clickBannerDelegate:NSObjectProtocol {
    func clickBannerToDo(index:Int)
}


class ZZWBannerScrollView: UIView {
    
    weak var delegate:clickBannerDelegate?

    
    var headScroll = SDCycleScrollView()
    
    var modelArray = Array<ZZWBannerModel>()

    var picArr = Array<String>()

    override init(frame: CGRect) {
        super.init(frame: frame)
        headScroll = SDCycleScrollView.init(frame: CGRect.init(x: 0, y: 0, width: self.width, height: 200), delegate: self, placeholderImage: UIImage.init(named: "PersonCenterbackImage"))
        
        headScroll.autoScrollTimeInterval = 2.0
        self.addSubview(headScroll)
    }
    
    
    func getScrollImgSource(source: Array<ZZWBannerModel>) {
        for model:ZZWBannerModel in source {
            picArr.append(model.photo!)
            modelArray.append(model)
        }
        headScroll.imageURLStringsGroup = picArr
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension ZZWBannerScrollView:SDCycleScrollViewDelegate{
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        
        if picArr[index].characters.count > 0 {
            print(picArr[index])
            self.delegate?.clickBannerToDo(index:index)
        }
    }
}
