//
//  Animator.swift
//  TransfromAnimatorSwift
//
//  Created by 李国民 on 15/8/21.
//  Copyright (c) 2015年 李国民. All rights reserved.
//

import Foundation
import UIKit


class Animator: NSObject,UIViewControllerAnimatedTransitioning{
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 1
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        
        //UIViewControllerContextTransitioning 系统提供的VC切换上下文
        var fromVc = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        var toVc = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        toVc?.view.alpha = 0
        transitionContext.containerView().addSubview(toVc!.view)
        UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: { () -> Void in
            
            fromVc?.view.transform = CGAffineTransformMakeScale(0.1, 0.1)
            toVc?.view.alpha = 1
            
        }) { (finish) -> Void in
            fromVc?.view.transform = CGAffineTransformIdentity
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }
}


