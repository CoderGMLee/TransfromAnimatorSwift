//
//  ChildViewController.swift
//  TransfromAnimatorSwift
//
//  Created by 李国民 on 15/8/21.
//  Copyright (c) 2015年 李国民. All rights reserved.
//

import Foundation
import UIKit


class ChildViewController : UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orangeColor()        
        var btn = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        var frame = CGRectMake(100, 100, 100, 100)
        btn.frame = frame
        btn.backgroundColor = UIColor.redColor()
        btn.setTitle("back", forState: UIControlState.Normal)
        btn.addTarget(self, action: "btnClicked", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
        
    }
    
    
    func btnClicked(){
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

