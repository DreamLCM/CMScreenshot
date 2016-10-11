//
//  ShareViewController.swift
//  CMScreenshot
//
//  Created by apple on 2016/10/10.
//  Copyright © 2016年 CM. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {

    @IBOutlet weak var imageViewShare: UIImageView!
    @IBOutlet weak var imageViewLogo: UIImageView!
    @IBOutlet weak var imageViewQRCode: UIImageView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let GR = UITapGestureRecognizer(target: self, action: #selector(self.hiddenView(gr:)))
        self.view.addGestureRecognizer(GR)
        
        
    }
    
    
    func hiddenView(gr:UIGestureRecognizer) {
        self.dismiss(animated: true) { 
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
