//
//  WaterFallLayout.swift
//  WaterFallUtil
//
//  Created by chovans on 15/9/13.
//  Copyright © 2015年 chovans. All rights reserved.
//

import UIKit

struct constant{
    static let screenWidth = UIScreen.mainScreen().bounds.width
    static let screenHeight = UIScreen.mainScreen().bounds.height
    static let spacing:Int = 5  //间隔数值（可自定义）
    static let cols:Int = 3     //几列（可自定义）
    static let backgroundColor:UIColor = UIColor.purpleColor()   //背景色（可自定义）
}


class WaterFallLayout:UIView {
    //主scrollView
    var scrollVew = UIScrollView(frame: CGRect(x: 0, y: 20, width: constant.screenWidth, height: constant.screenHeight) )
    //用于储存每列高度
    var colsHeight = [Int](count: constant.cols, repeatedValue: constant.spacing)
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        //检测是否重新布局
        if(frame.width != 0){
            scrollVew = UIScrollView(frame: frame)
        }
        
        //相关属性设置
        scrollVew.userInteractionEnabled = true
        scrollVew.alwaysBounceVertical = true
        scrollVew.showsVerticalScrollIndicator = false
        scrollVew.scrollEnabled = true
        scrollVew.backgroundColor = constant.backgroundColor
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //添加自定义view
    func addCustomSubView(var customView:UIView){
        //1.检查哪一列最短
        let col = returnMinHeight()
        
        //2.计算x轴
        let colWidth = (Int(scrollVew.bounds.width) - (constant.spacing * (colsHeight.count + 1))) / colsHeight.count
        let x = (colWidth * col) + (constant.spacing * (col + 1))
        customView = resizeView(customView, targetWidth: colWidth)

        //3.插入
        customView.frame = CGRect(x: CGFloat(x), y: CGFloat(colsHeight[col]), width: customView.bounds.width , height: customView.bounds.height)
        scrollVew.addSubview(customView)
        
        //4.重置高度
        colsHeight[col] = colsHeight[col] + Int(customView.bounds.height) + 5
        
        //5.修改scrollView高度
        scrollVew.contentSize = CGRect(x: 0, y: 20, width: Int(scrollVew.bounds.width), height: colsHeight.maxElement()! + 5 ).size
        
    }
    
    
    func returnMinHeight() -> Int{
        
        let minHeight:Int = colsHeight.minElement()!
        
        for(var i=0;i<self.colsHeight.count;i++){
            if(colsHeight[i] == minHeight){
                return i;
            }
        }
        
        return 0;
    }
    
    //改变view的大小以适应屏幕
    func resizeView(view:UIView,targetWidth:Int) -> UIView {
        let rate =  view.bounds.height / view.bounds.width
        //以动画的方式改变，若不需要则只需执行仲坚一句
        UIView.animateWithDuration(0.5) { () -> Void in
            view.frame = CGRect(x: view.center.x, y: view.center.y, width: CGFloat(targetWidth), height: CGFloat(targetWidth)*rate)
        }
        return view
    }
    
}
