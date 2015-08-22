//
//  ViewController.swift
//  TransfromAnimatorSwift
//
//  Created by 李国民 on 15/8/21.
//  Copyright (c) 2015年 李国民. All rights reserved.
//

import UIKit


//学习网站：http://onevcat.com/2013/10/vc-transition-in-ios7/
class ViewController: UIViewController,UIViewControllerTransitioningDelegate {

    var animator = Animator()
    var percentDrivenTransition : UIPercentDrivenInteractiveTransition! //通过百分比来控制交互类
    var screenEdgeGuesture : UIScreenEdgePanGestureRecognizer!
    var childVc : ChildViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var btn = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        btn.frame = CGRectMake(100, 200, 100, 100);
        btn.setTitle("present", forState: UIControlState.Normal)
        btn.addTarget(self, action: "btnClicked", forControlEvents: UIControlEvents.TouchUpInside)
        btn.backgroundColor = UIColor.blueColor()
        self.view.addSubview(btn)
        addScreenPanGuesture()
    }

    func btnClicked(){
        
        var childVc = ChildViewController()
        childVc.transitioningDelegate = self
        self.presentViewController(childVc, animated: true, completion: nil)
    }
    
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animator
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return Animator1()
    }

    //有交互的动画   手势驱动
    func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.percentDrivenTransition
    }
//    func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        return self.percentDrivenTransition
//    }
    
    func addScreenPanGuesture(){
        
        self.screenEdgeGuesture = UIScreenEdgePanGestureRecognizer()
        screenEdgeGuesture.edges = UIRectEdge.Right
        screenEdgeGuesture.addTarget(self, action: "panGuesture:")
        self.view.addGestureRecognizer(screenEdgeGuesture!)
        
    }
    
    func panGuesture(guesture : UIScreenEdgePanGestureRecognizer){
        let progress = abs(guesture.translationInView(UIApplication.sharedApplication().keyWindow!).x) / UIApplication.sharedApplication().keyWindow!.bounds.width
        
//        var point = guesture.translationInView(guesture.view!) as CGPoint
//        var progress1 = point.x / UIScreen.mainScreen().bounds.width
        
        if(guesture.state == UIGestureRecognizerState.Began){
            
            self.percentDrivenTransition = UIPercentDrivenInteractiveTransition()
            self.childVc = ChildViewController()
            self.childVc.transitioningDelegate = self
            self.presentViewController(self.childVc, animated: true, completion: { () -> Void in
                
            })
        }else if(guesture.state == UIGestureRecognizerState.Changed){
            
            self.percentDrivenTransition?.updateInteractiveTransition(progress)
            
        }else if(guesture.state == UIGestureRecognizerState.Ended || guesture.state == UIGestureRecognizerState.Cancelled){
            
            if(progress >= 0.5){
                self.percentDrivenTransition.finishInteractiveTransition()
            }else{
                self.percentDrivenTransition.cancelInteractiveTransition()
            }
//            self.percentDrivenTransition = nil
        }
    }
    
}


