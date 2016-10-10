//
//  ViewController.swift
//  CMScreenshot
//
//  Created by apple on 2016/10/6.
//  Copyright © 2016年 CM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
                

    }

    @IBAction func enterAction(_ sender: UIButton) {
        // 进入截图主界面
        let vc = ScreenshotViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

