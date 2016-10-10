//
//  UIView+extension.swift
//  CMScreenshot
//
//  Created by apple on 2016/10/6.
//  Copyright © 2016年 CM. All rights reserved.
//

import UIKit

extension UIView {
    
//    func cm_viewCutter() -> UIImage {
//        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
//        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
//        let img = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return img!
//    }
    
    
    // 截屏+弹出视图
    func cm_viewCutter2(title: String,textColor: UIColor,handleShare: ((UIImage) -> Void)? = nil) -> UIImage {
        
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
        
        
        return img!
    }
    
}
