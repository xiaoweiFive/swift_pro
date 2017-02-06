//
//  ZZWSaleDetailRewardInfoCell.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/1/23.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit

class ZZWSaleDetailRewardInfoCell: UITableViewCell {

    @IBOutlet weak var rewordImageView: UIImageView!
    
    @IBOutlet weak var rewordMoneyLabel: UILabel!
    
    @IBOutlet weak var rewordDetailLabel: UILabel!
    
    @IBOutlet weak var rewordHadPayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
