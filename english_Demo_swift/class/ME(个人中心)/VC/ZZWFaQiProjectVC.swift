//
//  ZZWFaQiProjectVC.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/1/3.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit
import MJExtension
import SDWebImage
import MJRefresh

class ZZWFaQiProjectVC: UIViewController {

    var objArr = [ZZWObject]()
    let header = MJRefreshNormalHeader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myTableView)
//        self.myTableView.mj_header = MJRefreshHeader(refreshingBlock: { 
//            self.headerRefresh()
//        })
        header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
        myTableView.mj_header = header
        headerRefresh()
        
        
        let width:CGFloat = SCREEN_WIDTH/5 * 2
     btnhahha(frame: CGRect(x: 12.099, y: 323.324, width: 33.32, height: width*2))
        
//        //自定义对象读取
//        let userDefault = UserDefaults.standard
//        let myModelData = userDefault.data(forKey: "myModel")
//        let myModel = NSKeyedUnarchiver.unarchiveObject(with: myModelData!) as! userInfo
//        print(myModel.name)
//        print(myModel.phone)
    }

    
    func btnhahha(frame:CGRect)  {
        let btn =  UIButton.init(frame:CGRect(x: frame.origin.x, y: frame.origin.x, width: frame.origin.x, height: frame.origin.x))
        print(btn)
    }
    
    
    
    func headerRefresh()  {
        let path = "http://index.qschou.com/v2.1.1/projects/recommendation?page=1"
        
        ZZWHttpTools.share.getWithPath(path: path, parameters: nil, success: { (json) in
            let arrProject = json["data"].arrayObject as! [[String : AnyObject]]
            
            for dict in arrProject{
                let  proJectModel  = ZZWObject().mj_setKeyValues(dict)
                self.objArr.append(proJectModel!)
            }
            
            self.myTableView.mj_header.endRefreshing()
            DispatchQueue.main.async(execute: {
                self.myTableView.reloadData()
            })
        }) { (error) in
            print("-=-=-=-=-=-=请求失败-=-=-=-=-=-=-=-")
        }
    }
    
    
    lazy var myTableView:UITableView = {
        
        let realTableView = UITableView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-64), style: .plain)
        
        realTableView.delegate = self
        realTableView.dataSource = self
//        realTableView.separatorStyle = .none
        realTableView.backgroundColor = COLOR_NAV_BG
        realTableView.separatorColor = UIColor(red:0.9,  green:0.9,  blue:0.9, alpha:1)
        realTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        realTableView.register(UINib.init(nibName: "ZZWProjectCardCell", bundle: nil), forCellReuseIdentifier: "myCell")
        realTableView.estimatedRowHeight = 44.0
        realTableView.rowHeight = UITableViewAutomaticDimension
        return realTableView
    }()
}


// MARK: - UITableViewDataSource, UITableViewDelegate
extension ZZWFaQiProjectVC:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.objArr.count
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 90
//    }
//   
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let obj:ZZWObject = objArr[indexPath.row];

        let mycell : ZZWProjectCardCell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! ZZWProjectCardCell

        mycell.selectionStyle = .none
        mycell.projectUser.text = obj.uuid;
        mycell.productBiaoQian.text = obj.template;
        mycell.productTitle.text = obj.title;
//        mycell.imageArray = obj.cover
        mycell.setImageCellData(projectModel: obj)

        return mycell
    }
    
    

    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let obj:ZZWObject = objArr[indexPath.row];
        let saleDetailVc = ZZWSaleDetailViewController()
        
        print("------",obj.uuid)
        
        saleDetailVc.uuid = obj.uuid
        saleDetailVc.template_id = "sale"

        self.navigationController?.pushViewController(saleDetailVc, animated: true)
    }
    
}
