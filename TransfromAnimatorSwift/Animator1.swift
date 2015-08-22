

//
//  Animator1.swift
//  TransfromAnimatorSwift
//
//  Created by 李国民 on 15/8/21.
//  Copyright (c) 2015年 李国民. All rights reserved.
//

import Foundation
import UIKit

class Animator1: NSObject,UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 1
    }
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        var fromVc = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        var toVc = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        transitionContext.containerView().addSubview(toVc!.view)
        fromVc?.view.alpha = 1
        toVc?.view.transform = CGAffineTransformMakeScale(0.1, 0.1)
        UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: { () -> Void in
            toVc?.view.transform = CGAffineTransformIdentity
            fromVc?.view.alpha = 0
        }) { (finish) -> Void in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }
}
