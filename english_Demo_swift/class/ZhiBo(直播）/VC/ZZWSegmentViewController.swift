//
//  ZZWSegmentViewController.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/1/16.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit

class ZZWSegmentViewController: UIViewController {

    
//    var dataSource = Array<TopicModel>()
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.view.addSubview(self.tableView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var tableView: UITableView = {
        let table = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), style: .plain)
        table.delegate = self
        table.dataSource = self
        
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 242))
        view.backgroundColor = UIColor.white
        table.tableHeaderView = view
        table.scrollIndicatorInsets = UIEdgeInsets.init(top: 182, left: 0, bottom: 0, right: 0)
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ZZWSegmentViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellID = "cell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellID)
        }
        
//        cell?.sendModel(model: self.dataSource[indexPath.row])
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
    }
    
}
