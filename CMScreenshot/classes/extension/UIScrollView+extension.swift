//
//  UIScrollView+extension.swift
//  CMScreenshot
//
//  Created by apple on 2016/10/10.
//  Copyright © 2016年 CM. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
    
    
   
    
    public func cm_scrollViewCutter(title: String,textColor: UIColor,handleShare: ((UIImage,UIViewController) -> Void)? = nil) -> UIImage {
    
        self.bounces = false
        self.isScrollEnabled = false
        
        let savedContentOffset = self.contentOffset
        let savedFrame = self.frame
        self.contentOffset = CGPoint.zero
        self.frame = CGRect(x: 0, y: 0, width: self.contentSize.width, height: self.contentSize.height)
        
        //截屏
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
    
        let img = UIGraphicsGetImageFromCurrentImageContext()
  
        UIGraphicsEndImageContext()
        
        self.contentOffset = savedContentOffset
        self.frame = savedFrame

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

    
//    func cm_scrollViewCutter() {
//        let savedContentOffset = self.contentOffset
//        let savedFrame = self.frame
//        self.contentOffset = CGPoint.zero
//        self.frame = CGRect(x: 0, y: 0, width: self.contentSize.width, height: self.contentSize.height)
//
//    }
    
}
