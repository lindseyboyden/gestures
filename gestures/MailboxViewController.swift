//
//  MailboxViewController.swift
//  gestures
//
//  Created by Lindsey Boyden on 10/1/15.
//  Copyright © 2015 Lindsey Boyden. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController {

    @IBOutlet weak var deleteIcon: UIImageView!
    @IBOutlet weak var archiveIcon: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var messageImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    var originalPosition: CGFloat!
    var archivePosition: CGFloat!
    var deletePosition: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = imageView.image!.size
       
    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onPan(panGestureRecognizer: UIPanGestureRecognizer) {
        
        var translation = panGestureRecognizer.translationInView(view)
        var point = panGestureRecognizer.locationInView(view)
        var velocity = panGestureRecognizer.velocityInView(view)
        
        
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            print("Gesture began at: \(point)")
            
            originalPosition = messageImage.center.x
            archiveIcon.alpha = 0.2
            archivePosition = archiveIcon.center.x
            deleteIcon.alpha = 0
            deletePosition = deleteIcon.center.x
           
            
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            print("Gesture changed at: \(point)")
            
            messageImage.center.x = originalPosition + translation.x
            
            
            if translation.x > 260 {
               containerView.backgroundColor =  UIColor.redColor()
                archiveIcon.alpha = 0
                deleteIcon.alpha = 1
                deleteIcon.center.x = deletePosition + translation.x - 260
                
                print("passed 260")
            }
            else if translation.x > 60  {
                containerView.backgroundColor = UIColor.greenColor()
                archiveIcon.alpha = 1
                archiveIcon.center.x = archivePosition + translation.x - 60
                deleteIcon.alpha = 0
                deleteIcon.center.x = deletePosition
            }
            else {
                containerView.backgroundColor =  UIColor.lightGrayColor()
                deleteIcon.alpha = 0
                deleteIcon.center.x = deletePosition
            }
            
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            print("Gesture ended at: \(point)")
            
           
            
            UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: { () -> Void in
                self.messageImage.center.x = self.originalPosition
                }, completion: { (completed) -> Void in
                    //finished
            })
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
