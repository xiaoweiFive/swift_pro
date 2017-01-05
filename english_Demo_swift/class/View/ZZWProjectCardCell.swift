//
//  ZZWProjectCardCell.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/1/4.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit
import Foundation

class ZZWProjectCardCell: UITableViewCell {

    var proobjModel:ZZWObject?
    
        @IBOutlet weak var headImageView: UIImageView!
    
    @IBOutlet weak var projectUser: UILabel!
    
    @IBOutlet weak var productBiaoQian: UILabel!
    
    @IBOutlet weak var productTitle: UILabel!
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        imageCollectionView.backgroundColor = UIColor.clear
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection = .horizontal
//        flowLayout.minimumLineSpacing = 5
//        flowLayout.minimumInteritemSpacing = 5
//        flowLayout.itemSize = CGSize(width: 124, height: 124)
//        self.imageCollectionView.collectionViewLayout = flowLayout
//        self.imageCollectionView.showsHorizontalScrollIndicator = false
//        self.imageCollectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 15)
//        self.imageCollectionView.register(UINib(nibName: "ZZWImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ZZWImageCollectionViewCell")
//        
//        self.imageCollectionView.dataSource = self
//        self.imageCollectionView.delegate = self
//    }
//
//    
//    var imageArray:[QSCImage]?{
//        didSet{
//            self.imageCollectionView.reloadData()
//        }
    }
    
    func setImageCellData(projectModel:ZZWObject)  {
        imageCollectionView.backgroundColor = UIColor.clear
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.itemSize = CGSize(width: 124, height: 124)
        self.imageCollectionView.collectionViewLayout = flowLayout
        self.imageCollectionView.showsHorizontalScrollIndicator = false
        self.imageCollectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 15)
        self.imageCollectionView.register(UINib(nibName: "ZZWImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ZZWImageCollectionViewCell")
        
        self.imageCollectionView.dataSource = self
        self.imageCollectionView.delegate = self
        proobjModel = projectModel
        self.projectUser.text = projectModel.uuid;
        self.productBiaoQian.text = projectModel.template;
        self.productTitle.text = projectModel.title;
        self.imageCollectionView.reloadData()
        print("--------")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}


extension ZZWProjectCardCell:UICollectionViewDelegate,UICollectionViewDataSource{

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return (proobjModel?.cover?.count)!
//        return (imageArray?.count)!
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "ZZWImageCollectionViewCell", for: indexPath) as! ZZWImageCollectionViewCell
        
        let item = (proobjModel?.cover?[indexPath.row])! as QSCImage
        
        guard <#condition#> else {
            <#statements#>
        }
        
        cell.ZZWimageView.sd_setImage(with: URL(string: (item.image)!))

//        let item = (imageArray?[indexPath.row])! as QSCImage
//        print(item.image ?? "1111111")
//        print(item.thumb ?? "2222222")
//        cell.imageItem = item

        return cell
    }
    
    
    
    
}
