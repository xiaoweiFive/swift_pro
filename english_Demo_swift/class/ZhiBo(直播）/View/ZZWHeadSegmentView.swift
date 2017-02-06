//
//  ZZWHeadSegmentView.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/1/16.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit

protocol  HeadSegmentViewDelegate:NSObjectProtocol {
    func clickSegment(index:NSInteger)
}


class ZZWHeadSegmentView: UIView {
    
    var  titleArray = Array<UIButton>()
    
//    var titlearr:Array<Any>?
    
    
    var  redLineView = UIView()
    var scroll = UIScrollView()
    weak var delegate:HeadSegmentViewDelegate?
    
    
//    convenience init(newtitleArray:Array<UIButton>,frame:CGRect){
//        self.init()
//        self.titlearr = newtitleArray
//    }
//    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        scroll = UIScrollView.init(frame: CGRect(x: 0, y: 0, width: self.width, height: self.height))
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.backgroundColor = UIColor.randomColor()
        
        redLineView = UIView.init()
        redLineView.backgroundColor = UIColor.randomColor()
        scroll.addSubview(redLineView)
        self.addSubview(scroll)
    }
    
    func sendData(array:Array<String>) {
        var btnOffset:CGFloat = 0
        for i in 0...array.count-1 {
            let btn = UIButton.init(type: .custom)
            btn.setTitle(array[i], for: .normal)
            btn.setTitleColor(UIColor.darkGray, for: .normal)
            btn.setTitleColor(UIColor.red, for: .selected)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            
            let size = UIButton.sizeOfLabel(customMaxWidth: SCREEN_WIDTH, systemFontSize: 14, filledTextString: array[i])
            let originX = (i != 0 ? 15*2+btnOffset : 15);
            btn.frame = CGRect.init(x: originX, y: 14, width: size.width, height: size.height)
            btnOffset = btn.frame.maxX
            
            btn.titleLabel?.textAlignment = .center
            btn.addTarget(self, action: #selector(changeSelectedItem(_ :)), for: .touchUpInside)
            scroll.addSubview(btn)
            self.titleArray.append(btn)
            
            if i == 0 {
                btn.isSelected = true
                redLineView.frame = CGRect.init(x: 15, y: scroll.height-2, width: btn.width, height: 2)
            }
        }
        scroll.contentSize = CGSize.init(width: btnOffset+15, height: 25)
    }
    
    
    func changeSelectedItem(_ button:UIButton)  {
        for btn:UIButton in self.titleArray {
            btn.isSelected = false
        }
        button.isSelected = true
        let array = self.titleArray as NSArray
        let index = array.index(of: button)
        UIView.animate(withDuration: 0.3) { 
            if index == 0{
            self.redLineView.frame = CGRect.init(x: 15, y: self.height-2, width: button.width, height: 2)
            }else{
                let preButton:UIButton = self.titleArray[index - 1]
                let offsetX = preButton.frame.minX - 15*2
                self.scroll.scrollRectToVisible(CGRect.init(x: offsetX, y: 0, width: self.scroll.width, height: self.scroll.height), animated: true)
                self.redLineView.frame = CGRect.init(x: button.frame.minX, y: self.height-2, width: button.width, height: 2)
                
            }
        }
        
       delegate?.clickSegment(index: index)
    }
    
    
    func getIndex(index : NSInteger){
        
        for btn : UIButton in self.titleArray {
            btn.isSelected = false
        }
        let button = self.titleArray[index]
        button.isSelected  = true
        UIView.animate(withDuration: 0.3, animations: {
            if index == 0 {
                
                self.redLineView.frame = CGRect.init(x: 15, y: self.height-2, width: button.width, height: 2)
            }else{
                
                let preButton:UIButton = self.titleArray[index-1]
                
                let offsetX = preButton.frame.minX - 15*2
                
                self.scroll.scrollRectToVisible(CGRect.init(x: offsetX, y: 0, width: self.scroll.width, height: self.scroll.height), animated: true)
                
                self.redLineView.frame = CGRect.init(x: button.frame.minX, y: self.scroll.height-2, width: button.width, height: 2)
            }
        }) { (bool) in
            
        }
    }
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    
    
}
