
//
//  ZZWHomeBannerTableViewCell.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/4/12.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit
import SwiftyJSON

class ZZWHomeBannerTableViewCell: UITableViewCell {
    
    
    var pptvc:CorePPTVC?


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    
    func setCellData(homeNavModel:ZZWHomeNavModel) {
        if self.pptvc == nil {
            print("fsafsafsadfas")
            let pptvc = CorePPTVC()
            self.pptvc = pptvc
            self.contentView.addSubview(pptvc.view)
            homeNavModel.currentVC?.addChildViewController(self.pptvc!)
        }
        
        var list = Array<Any>()
        
        for dict in homeNavModel.list! {
            
           let  desc = ZZWHomeListDesc()
            desc.setValuesForKeys(dict as! [String : Any])
            let model = PPTModel()
            model.imageURLString = desc.image
            model.gotoURLString = desc.url
            list.append(model)
        }
        
        self.pptvc?.pptModels = list
        self.pptvc?.view.frame = self.contentView.bounds
        
        
        
        self.pptvc?.pptItemClickBlock = { (pptModel:PPTModel?) in
            print("0000000000000000000000")
            
            print(pptModel?.gotoURLString)
            
            
        }
        self.pptvc?.clv.reloadData()
        
        
    }
   
}
