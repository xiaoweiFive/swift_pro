//
//  ZZWHomePageViewController.swift
//  english_Demo_swift
//
//  Created by 张振伟 on 17/1/7.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit

class ZZWHomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.randomColor()        
        
        3.times { (i) in
            print("customFunc++++++",i)
        }
        
        3.myTimes {
            
        }
        
        5.tupleTimes { (tupleCustomFunc:(Int,Int))->() in
            print("tupletimes+jjjj",tupleCustomFunc)
        }
        
        
        // 使用类方法
        Thread.detachNewThreadSelector(#selector(ZZWHomePageViewController.timeClick), toTarget: self, with: nil)
        
        //实例方法－便利构造器
        let myThread = Thread(target: self, selector: #selector(ZZWHomePageViewController.timeClick), object: nil)
        myThread.start()
        
        
        let operation = BlockOperation {
            self.downLoadImage()
            return
        }
        //创建一个NSOperationQueue实例并添加operation
        let queue = OperationQueue()
        queue.addOperation(operation)
        
        
        
        }
    
    func downLoadImage()  {
        let imageUrl = "http://hangge.com/blog/images/logo.png"
        let data = try! Data(contentsOf: URL(string: imageUrl)!)
        print(data.count)
    }
    
    
    func timeClick()  {
        print("timeClick   ++++    hhahhaha")
    }
   
}



class DowmloadImageOperation: Operation {
    override func main() {
        let imageUrl = "http://www.hangge.com/blog/images/logo.png"
        let data = try! Data(contentsOf: URL(string: imageUrl)!)
        print(data.count)
        
    }
}


extension Int{
    
    func times(customFunc:(Int)->())  {
        print("INT")
        for i in 1...self {
            customFunc(i)
        }
    }
    
    func myTimes(myCustomFunc:(Void)->Void) {
        print("void")
        for _ in 1...self {
            myCustomFunc()
        }
    }
    
    func tupleTimes(tupleCustomFunc:(Int,Int)->()) {
        print("tuple")
        for i in 1...self {
            tupleCustomFunc(i, i)
        }
    }
    
    
}



