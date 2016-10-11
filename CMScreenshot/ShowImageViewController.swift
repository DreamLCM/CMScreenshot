//
//  ShowImageViewController.swift
//  CMScreenshot
//
//  Created by apple on 2016/10/6.
//  Copyright © 2016年 CM. All rights reserved.
//

import UIKit



open class CMButton: UIButton {
    var target: AnyObject!
    var selector: Selector!
    var action:(() -> Void)!
    var customBackgroundColor:UIColor?
    var customTextColor: UIColor?
    var initialTitle:String!
}


class ShowImageViewController: UIViewController {
    
    
    typealias ButtonShareAction = (UIImage,UIViewController) -> Void
    var buttonShareAction: ButtonShareAction?
    
    // 成员变量
   
    
    var imageView = UIImageView()
    var scrollView = UIScrollView()
    var image = UIImage()
    var imageViewLeftDown = UIImageView()
    var titleButton = ""
    var textColor = UIColor()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func initView() {
        
        self.view.backgroundColor = UIColor(white: 1/256, alpha: 0.9)
        
        // scrollView
        scrollView = UIScrollView(frame: CGRect(x: 20, y: 25, width: self.view.bounds.size.width - 40, height: self.view.bounds.size.height - 50))
        scrollView.contentSize = CGSize(width: scrollView.bounds.size.width, height: image.size.height * scrollView.bounds.size.width / image.size.width)
        scrollView.layer.cornerRadius = 8
        scrollView.layer.masksToBounds = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        // 禁止滑动
        scrollView.isScrollEnabled = false
        self.view.addSubview(scrollView)
        
        // imageView
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.scrollView.contentSize.width, height: self.scrollView.contentSize.height))
        imageView.image = image
        imageView.backgroundColor = UIColor.lightGray
        imageView.layer.cornerRadius = 8
        scrollView.addSubview(imageView)
    
        // UIButton
        let shareBtn = CMButton()
        shareBtn.frame = CGRect(x: 40, y: scrollView.bounds.size.height-50, width: (scrollView.bounds.size.width-40)/2.0 - 10, height: 35)
        shareBtn.backgroundColor = UIColor.gray
        shareBtn.layer.cornerRadius = 5
        shareBtn.alpha = 0.8
        shareBtn.setTitle(titleButton, for: .normal)
        shareBtn.setTitleColor(textColor, for: .normal)
        shareBtn.addTarget(self, action: #selector(self.shareBtnAction(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(shareBtn)

        let cancelBtn = UIButton(type: .system)
        cancelBtn.setTitle("取消", for: .normal)
        cancelBtn.frame = CGRect(x: scrollView.bounds.size.width / 2.0 + 30, y: scrollView.bounds.size.height-50, width: (scrollView.bounds.size.width - 40) / 2.0 - 10, height: 35)
        cancelBtn.addTarget(self, action: #selector(self.cancelBtn), for: UIControlEvents.touchUpInside)
        cancelBtn.backgroundColor = UIColor.gray
        cancelBtn.layer.cornerRadius = 5
        cancelBtn.alpha = 0.8
        cancelBtn.setTitleColor(UIColor.white, for: .normal)
        self.view.addSubview(cancelBtn)
        
        
        imageViewLeftDown = UIImageView(frame: CGRect(x: 0, y: 200, width: 100, height: 64))
        imageViewLeftDown.image = UIImage(named: "swift.png")
        self.view.addSubview(imageViewLeftDown)
        
        
        
    }
    
    
    // 分享
    func shareBtnAction(sender: CMButton) {
        self.buttonShareAction?(self.image,self)
//        print("点击了分享按钮")
        

        
        
        
    }

    
    
    // 取消
    func cancelBtn() {
        self.dismiss(animated: true) {
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
