//
//  ZZWVCManagerView.swift
//  english_Demo_swift
//
//  Created by 张振伟 on 17/1/7.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit

enum sliderWidthEnum:NSInteger{
    case BottomWidth = 1
    case BottomTitleWidth = 2
}


protocol VCManagerDelegate:NSObjectProtocol {
    func VCMangerDidSelected(_ VCManager:ZZWVCManagerView , index:NSInteger , title:String)
}

class ZZWVCManagerView: UIView {
    //选中按钮的颜色
    var  selectedColor = COLOR_NAV_BG{
        didSet{
            reloadBT_Colors()
        }
    }
    //非选中颜色
    var normalColor = UIColor.lightGray{
        didSet{
            reloadBT_Colors()
        }
    }
    
//    按钮数组
    var Bt_array:[UIButton] = [UIButton]()
//    当前按钮
    var selecter_Bt:UIButton!
//    按钮字体
    var title_font:UIFont?
//    滑块的宽度  枚举
    var silderWidthType:sliderWidthEnum = .BottomTitleWidth
//    点击按钮的代理
    weak var  delegate:VCManagerDelegate?
//    按钮title数组
    var title_array:[String] = []{
        didSet{
            setBTs()
        }
    }
    
    fileprivate var kBT_W:CGFloat?{
        get{
            if self.title_array.count > 5{
                return SCREEN_WIDTH/5
            }else{
                return SCREEN_WIDTH/CGFloat(self.title_array.count)
            }
        }
    }
    
    //滑动视图
    fileprivate lazy var scroView:UIScrollView = {
        
        let scro:UIScrollView = UIScrollView.init(frame: self.bounds)
        scro.showsHorizontalScrollIndicator = false
        scro.contentSize = CGSize.init(width: self.kBT_W! * CGFloat(self.title_array.count), height: self.height)
        scro.delegate = self
        self.addSubview(scro)
        return scro
        
    }()
    //滑块视图
    fileprivate lazy var sliderView:UIView = {
        
        let slider = UIView.init()
        self.addSubview(slider)
        self.bringSubview(toFront: slider)
        slider.layer.cornerRadius = 1
        slider.layer.masksToBounds = true
        
        return slider
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = UIColor.white
    }
    
    
    func setBTs()  {
        for index in 0..<title_array.count {
            
            let title = title_array[index]
            let bt = UIButton(type: .custom)
            bt.setTitle(title, for: .normal)
            bt.setTitleColor(normalColor, for: .normal)
            bt.setTitleColor(selectedColor, for: .selected)
            bt.setTitleColor(selectedColor, for: .highlighted)
            bt.frame = CGRect(x: CGFloat(index)*self.kBT_W!, y: 0, width: kBT_W!, height: self.height)
            if title_font != nil {
                bt.titleLabel?.font = title_font
            }else{
                bt.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            }
            bt.adjustsImageWhenDisabled = false;
            bt.adjustsImageWhenHighlighted = false
            self.Bt_array.append(bt)
            self.scroView.addSubview(bt)
            bt.addTarget(self, action: #selector(subBT_Click), for: .touchUpInside)
        }
        
        guard let firstBt = Bt_array.first else {
            return
        }
        sliderView.backgroundColor = self.selectedColor
        sliderView.y = firstBt.height-2
        selectorBT_beFirst(firstBt, true)

    }

    
    func subBT_Click(_ bt:UIButton)  {
        if bt == selecter_Bt {
            return
        }
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 20);
        delegate?.VCMangerDidSelected(self, index: Bt_array.index(of: bt)!, title: (bt.titleLabel?.text)!)
        selectorBT_beFirst(bt, false)
    }
    
    //按钮点击事件UI部分
    fileprivate func selectorBT_beFirst(_ bt : UIButton, _ beFirst:Bool){
        self.selecter_Bt  = bt
        bt.isSelected = true
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 20);
        otherBTset(bt)
        var offset = bt.centerX - self.width*0.5
        let max = scroView.contentSize.width - self.width
        if offset < 0 {
            
            offset = 0
        }
        if offset > max {
            offset = max
        }
        if scroView.contentSize.width < scroView.width {
            offset = 0
        }
        let rect = selecter_Bt.convert(self.frame, to: nil)
        var width:CGFloat?
        if silderWidthType == .BottomTitleWidth {
            width = (bt.titleLabel?.text)!.getTextSize(font: (bt.titleLabel?.font)!, size: bt.size).width
            
        }else
        {
            width = bt.width
        }
    
        if beFirst {
            self.sliderView.frame = CGRect.init(x: rect.origin.x + (self.kBT_W! - width!)/2, y: self.sliderView.y, width: width!, height: 2)
        }else{
            
            UIView.animate(withDuration: 0.2, animations: {() -> Void in
                
                self.sliderView.frame = CGRect.init(x: rect.origin.x + (self.kBT_W! - width!)/2, y: self.sliderView.y, width: width!, height: 2)
                self.scroView.contentOffset = CGPoint.init(x: offset, y: 0)
                
            }){finishit -> Void in
                
            }
        }
    }
    
    //选择指定按钮
    func reloadSelectedBT(at index:NSInteger) {

        if index < 0 || index > Bt_array.count - 1 {
            return
        }
        let bt = Bt_array[index]
        selectorBT_beFirst(bt, false)
    }
    
    
    //将未选择的按钮刷新着色
    fileprivate func otherBTset(_ bt : UIButton) {
        
        for temp_bt in Bt_array {
            temp_bt.titleLabel?.font = UIFont.systemFont(ofSize: 15);
            if temp_bt == bt {
                temp_bt.titleLabel?.font = UIFont.systemFont(ofSize: 20);
                continue
            }
            temp_bt.isSelected = false
        }
    }
    
    
    //刷新颜色
    fileprivate func reloadBT_Colors(){
        
        for item in Bt_array {
            
            item.setTitleColor(normalColor, for: .normal)
            item.setTitleColor(selectedColor, for: .selected)
            item.setTitleColor(selectedColor, for: .highlighted)
        }
        guard let firstBt = Bt_array.first else {
            return
        }
        firstBt.isSelected = true
        sliderView.backgroundColor = self.selectedColor
    }

    
}


extension ZZWVCManagerView:UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
      
        let rect = selecter_Bt.convert(self.frame, to: nil)
        var width:CGFloat?
        if silderWidthType == .BottomTitleWidth {
            
            width = (self.selecter_Bt.titleLabel?.text)!.getTextSize(font: (self.selecter_Bt.titleLabel?.font)!, size: self.selecter_Bt.size).width
            
        }else
        {
            width = self.selecter_Bt.width
        }
        UIView.animate(withDuration: 0.2, animations: {() -> Void in
            
            self.sliderView.frame = CGRect.init(x: rect.origin.x + (self.kBT_W! - width!)/2, y: self.sliderView.y, width: width!, height: 2)
            
        }){finished -> Void in
            
            
        }
        
    }
  
}
