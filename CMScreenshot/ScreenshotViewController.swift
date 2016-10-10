//
//  ScreenshotViewController.swift
//  CMScreenshot
//
//  Created by apple on 2016/10/6.
//  Copyright © 2016年 CM. All rights reserved.
//

import UIKit

class ScreenshotViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initView()

    }
    
    func initView() {
        self.view.backgroundColor = UIColor.purple
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 60, height: 64)
        button.setTitle("截屏", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(self.rightButton(sender:)), for: UIControlEvents.touchUpInside)
        let btnItem = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = btnItem
    }
    
    func rightButton(sender: UIButton) {
        
        // 调用截图方法
        
        // 有导航栏
        _ = self.view.cm_viewCutter2(title: "回调", textColor:UIColor.blue,handleShare: { (shotCutImage) in
            print(shotCutImage)
        })
        
        
        // 无导航栏
//        _ = self.view.cm_viewCutter2() {
//            (shotcutImage) -> Void in
//            print(shotcutImage)
//            print("点击")
//        }
        
   
}
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
