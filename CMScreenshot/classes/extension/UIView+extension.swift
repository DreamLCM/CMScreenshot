//
//  UIView+extension.swift
//  CMScreenshot
//
//  Created by apple on 2016/10/6.
//  Copyright © 2016年 CM. All rights reserved.
//

import UIKit

extension UIView {
    
    func cm_viewCutter() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
    
    
    // 截屏+弹出视图
    func cm_viewCutter2(title: String,textColor: UIColor,handleShare: ((UIImage,UIViewController) -> Void)? = nil) -> UIImage {
        
        //截屏
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)

        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        //弹出截图显示的view
        let vc = ShowImageViewController()
        vc.modalPresentationStyle = UIModalPresentationStyle.custom
        vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        vc.titleButton = title
        vc.image = img!
        vc.buttonShareAction = handleShare
        vc.titleButton = title
        vc.textColor = textColor
        let window = UIApplication.shared.windows[0]
        window.rootViewController?.present(vc, animated: true)
        
        
        // 拼接图片
        
        let width = CGFloat(375)
        let height = CGFloat(500)
        let offScreenSize = CGSize(width: width, height: height)
        
        UIGraphicsBeginImageContextWithOptions(offScreenSize, false, UIScreen.main.scale)
        
        let rect = CGRect(x: 0, y: 0, width: 60, height: 80)
        vc.imageView.image?.draw(in: rect)
        
        
        let rectR = CGRect(x: 30 , y: 30, width: 60, height: 80)
        vc.imageViewLeftDown.image?.draw(in: rectR)
        
        
        
        let resultingImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        
        
        
        return resultingImage!
//        return resultingImage!
    }
    
}
