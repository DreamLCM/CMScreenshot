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
        
        
        let width = self.frame.size.width
        let height = self.frame.size.height
        let offScreenSize = CGSize(width: width, height: height)
        
        UIGraphicsBeginImageContextWithOptions(offScreenSize, false, UIScreen.main.scale)
        
        let rect = CGRect(x: 0, y: 0, width: width/2, height: height)
        img?.draw(in: rect)
        
        
        let rectR = CGRect(x: rect.origin.x + 200, y: 0, width: vc.imageViewLeftDown.frame.size.width, height: height)
        vc.imageViewLeftDown.image?.draw(in: rectR)
        
        
       
        
        let resultingImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        
        
        return resultingImage!
//        return img!
    }
    
}
