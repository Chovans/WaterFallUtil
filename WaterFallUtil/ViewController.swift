//
//  ViewController.swift
//  WaterFallUtil
//
//  Created by chovans on 15/9/13.
//  Copyright © 2015年 chovans. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var wfv:WaterFallLayout = WaterFallLayout()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    //因为涉及到autolayout,所以需要在界面布局全部完成后开始执行
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    /**
        若需要自定义展示区域，则使用该方法
        
        let targetView = view.viewWithTag(11)! as UIView
        targetView.backgroundColor = UIColor.greenColor()
        //重新改变大小
        wfv = WaterFallLayout(frame: CGRect(x: 0, y: 0, width: targetView.bounds.width, height: targetView.bounds.height))
        

        
        targetView.addSubview(wfv.scrollVew)

    **/
        //若要全局展示，则使用该方法
        view.addSubview(wfv.scrollVew)
        
        
        //加载测试图片
        for index in 11...20{
            let cv = UIImageView(image: UIImage(named: "a\(index)"))
            wfv.addCustomSubView(cv)
        }

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

