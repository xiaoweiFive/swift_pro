//
//  ZZWImageCollectionViewCell.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/1/5.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit

class ZZWImageCollectionViewCell: UICollectionViewCell {

    
//    var imageItem:QSCImage?{
//        didSet{
//            print("imageimageimage")
//            ZZWimageView.sd_setImage(with: URL(string: (imageItem?.image)!))
//        }
//    }
//    
//    
    
    @IBOutlet weak var ZZWimageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
