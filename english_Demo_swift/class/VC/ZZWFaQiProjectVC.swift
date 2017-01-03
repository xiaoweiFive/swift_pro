//
//  ZZWFaQiProjectVC.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/1/3.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit

class ZZWFaQiProjectVC: UIViewController {

        
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        
        
    }

    lazy var tableView:UITableView = {
        let tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = COLOR_NAV_BG
        tableView.separatorColor = UIColor(red:0.9,  green:0.9,  blue:0.9, alpha:1)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
   
}


// MARK: - UITableViewDataSource, UITableViewDelegate
extension ZZWFaQiProjectVC:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
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
