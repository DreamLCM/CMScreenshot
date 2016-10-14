//
//  ScreenshotViewController.swift
//  CMScreenshot
//
//  Created by apple on 2016/10/6.
//  Copyright © 2016年 CM. All rights reserved.
//

import UIKit

class ScreenshotViewController: UIViewController {

    var scrllView = UIScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initView()

    }
    
    func initView() {
//        self.view.backgroundColor = UIColor.purple
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 60, height: 64)
        button.setTitle("截屏", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(self.rightButton(sender:)), for: UIControlEvents.touchUpInside)
        let btnItem = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = btnItem
        
//        scrllView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
//        scrllView.contentSize = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height+64)
//        self.view.addSubview(scrllView)
        
        let backImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        backImageView.image = UIImage(named: "city.jpeg")
        self.view.addSubview(backImageView)


//        let qrImageView = UIImageView(frame: CGRect(x: self.view.frame.size.width/4*3, y: self.view.frame.size.height, width: self.view.frame.size.width/4, height: 64))
//        qrImageView.image = UIImage(named: "qrCode.png")
//        scrllView.addSubview(qrImageView)


//        let imageViewLogo = UIImageView(frame: CGRect(x: 0, y: self.view.frame.size.height, width: self.view.frame.size.width/4, height: 64))
//        imageViewLogo.image = UIImage(named: "swift.png")
//        scrllView.addSubview(imageViewLogo)

    }
    
    func rightButton(sender: UIButton) {
        
        // 调用截图方法
        
        // 有导航栏
        _ = self.navigationController?.view.cm_viewCutter2(title: "分享", textColor:UIColor.blue,handleShare: { (shotCutImage,shareVc) in
            print(shotCutImage)
            
            let vc = ShareViewController()
            shareVc.present(vc, animated: true, completion: {
                vc.imageViewShare.image = shotCutImage
                
            })

        })
        
        
        // 无导航栏
//        _ = self.view.cm_viewCutter2() {
//            (shotcutImage) -> Void in
//            print(shotcutImage)
//            print("点击")
//        }
        
        
//        _ = self.scrllView.cm_scrollViewCutter(title: "分享", textColor: UIColor.blue, handleShare: { (shotCutImage, shareVc) in
//            print(shotCutImage)
//            
//            let vc = ShareViewController()
//            shareVc.present(vc, animated: true, completion: {
//                vc.imageViewShare.image = shotCutImage
//            })
//
//        })
        
        
   
}
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
