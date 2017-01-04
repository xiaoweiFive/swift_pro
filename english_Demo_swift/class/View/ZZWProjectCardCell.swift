//
//  ZZWProjectCardCell.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/1/4.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit

class ZZWProjectCardCell: UITableViewCell {

    var proobjModel:ZZWObject?
    
    @IBOutlet weak var headImageView: UIImageView!
    
    @IBOutlet weak var projectUser: UILabel!
    
    @IBOutlet weak var productBiaoQian: UILabel!
    
    @IBOutlet weak var productTitle: UILabel!
    
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


//extension ZZWProjectCardCell:UICollectionViewDelegate,UICollectionViewDataSource{
//    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return (proobjModel?.cover?.count)!
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
//        
//    }
//    
//}
