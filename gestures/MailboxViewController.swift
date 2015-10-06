//
//  MailboxViewController.swift
//  gestures
//
//  Created by Lindsey Boyden on 10/1/15.
//  Copyright © 2015 Lindsey Boyden. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController {

    @IBOutlet weak var rescheduleImage: UIImageView!
    @IBOutlet weak var listIcon: UIImageView!
    @IBOutlet weak var laterIcon: UIImageView!
    @IBOutlet weak var deleteIcon: UIImageView!
    @IBOutlet weak var archiveIcon: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var messageImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    var originalPosition: CGFloat!
    var archivePosition: CGFloat!
    var deletePosition: CGFloat!
    var laterPosition: CGFloat!
    var listPosition: CGFloat!
    var scrollViewPosition: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        originalPosition = messageImage.center.x
        archiveIcon.alpha = 0.2
        archivePosition = archiveIcon.center.x
        deleteIcon.alpha = 0
        deletePosition = deleteIcon.center.x
        laterIcon.alpha = 0.2
        laterPosition = laterIcon.center.x
        listIcon.alpha = 0
        listPosition = listIcon.center.x
        scrollViewPosition = scrollView.center.y
        
        scrollView.contentSize = imageView.image!.size
        rescheduleImage.alpha = 0
    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onScheduleTap(sender: UITapGestureRecognizer) {
        rescheduleImage.alpha = 0
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: { () -> Void in
            self.scrollView.center.y = self.scrollView.center.y - 76
            }) { (completed) -> Void in
                
                UIView.animateWithDuration(0.5, delay: 1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: { () -> Void in
                    self.scrollView.center.y = self.scrollView.center.y + 76
                    }, completion: { (completed) -> Void in
                        //finished
                })
        }
        
        
    }
    @IBAction func onPan(panGestureRecognizer: UIPanGestureRecognizer) {
        
        var translation = panGestureRecognizer.translationInView(view)
        var point = panGestureRecognizer.locationInView(view)
        var velocity = panGestureRecognizer.velocityInView(view)
        
        
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            print("Gesture began at: \(point)")
            
           /*
            originalPosition = messageImage.center.x
            archiveIcon.alpha = 0.2
            archivePosition = archiveIcon.center.x
            deleteIcon.alpha = 0
            deletePosition = deleteIcon.center.x
            laterIcon.alpha = 0.2
            laterPosition = laterIcon.center.x
            listIcon.alpha = 0
            listPosition = listIcon.center.x
            scrollViewPosition = scrollView.center.y
            
            */
            
           
            
            
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
                archiveIcon.center.x = archivePosition
                laterIcon.center.x = laterPosition
                listIcon.center.x = listPosition
                messageImage.alpha = 1
            }
            
            
            if translation.x < -260 {
                containerView.backgroundColor = UIColor.brownColor()
                laterIcon.alpha = 0
                listIcon.alpha = 1
                listIcon.center.x = listPosition + translation.x  + 260
                
                
                
            }
            else if translation.x < -60 {
                containerView.backgroundColor = UIColor.yellowColor()
                laterIcon.alpha = 1
                laterIcon.center.x = laterPosition + translation.x + 60
                listIcon.alpha = 0
                
            }
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            print("Gesture ended at: \(point)")
            
            if translation.x < -260 {
                rescheduleImage.alpha = 1
            }
            
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
