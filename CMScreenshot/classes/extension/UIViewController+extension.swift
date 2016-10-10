//
//  UIViewController+extension.swift
//  CMScreenshot
//
//  Created by apple on 2016/10/6.
//  Copyright © 2016年 CM. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    typealias Task = (_ cancel : Bool) -> ()
    
    //延迟执行
    func delay(_ time:TimeInterval, task:@escaping ()->()) ->  Task? {
        
        func dispatch_later(_ block:@escaping ()->()) {
            DispatchQueue.main.asyncAfter(
                deadline: DispatchTime.now() + Double(Int64(time * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC),
                execute: block)
        }
        
        let closure = task
        var result: Task?
        
        let delayedClosure: Task = {
            cancel in
            if (cancel == false) {
                DispatchQueue.main.async(execute: closure);
            }
            result = nil
        }
        
        result = delayedClosure
        
        dispatch_later {
            if let delayedClosure = result {
                delayedClosure(false)
            }
        }
        
        return result;
    }
    
    func cancel(_ task:Task?) {
        task?(true)
    }
    
    /**
     viewcontroller是否显示在当前window
     
     - returns:
     */
    var isVisible: Bool {
        if self.isViewLoaded && self.view.window != nil {
            return true
        } else {
            return false
        }
    }
}
