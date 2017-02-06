//
//  ZZWSaleDetailViewController.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/1/23.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit

class ZZWSaleDetailViewController: UIViewController {

    var template_id:String?
    var uuid:String?

    
    
    
    let rewordInfoCell:String = "ZZWSaleDetailRewardInfoCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(
        )
        
        view.addSubview(saleDetailTableView)
        
        let path = String(format: "http://api.qschou.com/v6/projects/%@/%@", self.template_id!,self.uuid!)
        ZZWHttpTools.share.zzwHttpRequest(path: path as String, parameters: nil, success: { (json) in
            
            let dict = json["data"].dictionaryObject;
            let arrproject = ZZWProjectTemplate().mj_setKeyValues(dict)
            print(arrproject?.reward ?? "")
            
        }) { (error) in
            print(error)
        }
        
    }
    
    
    
    lazy var saleDetailTableView:UITableView = {
        let myTableView = UITableView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-64), style: .plain)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.backgroundColor = COLOR_NAV_BG
        myTableView.separatorColor = UIColor(red:0.9,  green:0.9,  blue:0.9, alpha:1)
        
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        myTableView.register(UINib.init(nibName: "ZZWSaleDetailRewardInfoCell", bundle: nil), forCellReuseIdentifier: self.rewordInfoCell)
        
        
        myTableView.estimatedRowHeight = 44.0
        myTableView.rowHeight = UITableViewAutomaticDimension
        return myTableView
    }()
    
}



extension ZZWSaleDetailViewController:UITableViewDelegate,UITableViewDataSource{
    // MARK: - UITableViewDataSource, UITableViewDelegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let mycell : ZZWSaleDetailRewardInfoCell = tableView.dequeueReusableCell(withIdentifier: self.rewordInfoCell) as! ZZWSaleDetailRewardInfoCell
        return mycell
    }
    
    
    
    
}
