//
//  ZZWHomeNavigationViewController.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/4/12.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit
import Photos

class ZZWHomeNavigationViewController: ZZWBaseViewController {
    
    var bannerCell:ZZWHomeBannerTableViewCell?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        
        let cellID:String = "ZZWHomeBannerTableViewCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = Bundle.main.loadNibNamed("ZZWHomeBannerTableViewCell", owner: self, options: nil)?.last as! ZZWHomeBannerTableViewCell
            cell?.selectionStyle = .none
        }

        cell?.frame = CGRect(x: 0, y: -0.5, width: SCREEN_WIDTH, height: 160*RATE)
        bannerCell = cell as! ZZWHomeBannerTableViewCell?;
        self.view.addSubview(cell!)
    }
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.requestData()
    }
    
    lazy var tableView:UITableView = {
        
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-49), style: .grouped)
        tableView.backgroundColor = ZZWGrayColor
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.scrollsToTop = true
        tableView.contentInset = UIEdgeInsetsMake(160*RATE, 0, 0, 0 )
        return tableView
    }()

    lazy var indexModelArray:NSMutableArray = {
        let indexmodelArray:NSMutableArray = []
        return indexmodelArray
    }()
    
    func requestData()  {
        ZZWHttpTools.share.getWithPath(path: "http://index.qschou.com/v2.1.1/home", parameters: nil, success: { (json) in
            
            if(self.indexModelArray.count > 0){
                self.indexModelArray.removeAllObjects()
            }
            
            let arr = json["data"].arrayObject as! [[String : AnyObject]]
            for dict in arr{
                let topic = ZZWHomeNavModel()
                topic.setValuesForKeys(dict )
                self.indexModelArray.add(topic)
            }
            
            let homeNavModel:ZZWHomeNavModel = self.indexModelArray.firstObject as! ZZWHomeNavModel
            
            if homeNavModel.area == "banner" {
                homeNavModel.currentVC = self
                self.bannerCell?.setCellData(homeNavModel: homeNavModel)
            }
            
            self.tableView.reloadData()
        }) { (error) in
            print(error)
        }
    }
 
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension ZZWHomeNavigationViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.indexModelArray.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
     
        let homeModel = self.indexModelArray[section] as! ZZWHomeNavModel
        if homeModel.area == "recommend-love-project" {
            return homeModel.project_list!.count
        }
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let homeNavModel = self.indexModelArray[indexPath.section] as! ZZWHomeNavModel
        if ((homeNavModel.area == "topic-banner") || (homeNavModel.area == "banner")) && indexPath.section>0 {
            print("999999999999999999999999999999999999999999999999999999999999999999999999");
            return 160
        }
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let homeNavModel = self.indexModelArray[indexPath.section] as! ZZWHomeNavModel
        
        print("111111111111111111111111111111111111111111111111111111111111 %d", indexPath.row)
        print("222222222222222222222222222222222222222222222222222222222222 %d", homeNavModel.area ?? "")
        print("333333333333333333333333333333333333333333333333333333333333 %d", indexPath.section)

        if ((indexPath.row == 0) && (homeNavModel.area != "recommend-love-project") && (indexPath.section > 0)) {
            
            if ((homeNavModel.area == "topic-banner") || (homeNavModel.area == "banner")) {
                let cellID:String = "ZZWHomeBannerTableViewCell"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! ZZWHomeBannerTableViewCell?
                if cell == nil {
                    cell = Bundle.main.loadNibNamed("ZZWHomeBannerTableViewCell", owner: self, options: nil)?.last as! ZZWHomeBannerTableViewCell
                    cell?.selectionStyle = .none
                }
                homeNavModel.currentVC = self
                cell?.setCellData(homeNavModel: homeNavModel)
                
                return cell!
            }
        }
        
        let identifier="identtifier";
        var cell=tableView.dequeueReusableCell(withIdentifier: identifier)
        if(cell == nil){
            cell=UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: identifier);
        }
        cell?.selectionStyle = .none
        cell?.textLabel?.text = "3243242342\(indexPath)";
        cell?.detailTextLabel?.text = "待添加内容";
        cell?.detailTextLabel?.font = UIFont .systemFont(ofSize: CGFloat(13))
        cell?.accessoryType=UITableViewCellAccessoryType.disclosureIndicator
        return cell!
    }
}
