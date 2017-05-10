//
//  launchScreenViewController.swift
//  IGSHPA
//
//  Created by Mahesh Kumar Kankipati on 2/10/17.
//  Copyright © 2017 srivalli kanchibotla. All rights reserved.
//

import UIKit

class launchScreenViewController: UIViewController,UIViewControllerTransitioningDelegate {

    @IBOutlet weak var logo: UIImageView!
    let transition = CircularTransition()
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animateKeyframes(withDuration: 1.3, delay: 0.5, animations:{
            self.logo.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        },
                                completion: {(finished) -> Void in
                                    self.performSegue(withIdentifier: "loginScreen", sender: self)
                                    
        })
        

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "mainscreenSegue"{
                let secondVC = segue.destination as! MyViewController
                secondVC.transitioningDelegate = self
                secondVC.modalPresentationStyle = .custom
            }

        }
        
        
        func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            transition.transitionMode = .present
            transition.startingPoint = #imageLiteral(resourceName: "logo").center
            transition.circleColor = UIColor.black
            
            return transition
        }
        
        func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            transition.transitionMode = .dismiss
            transition.startingPoint = #imageLiteral(resourceName: "logo").center
            transition.circleColor = UIColor.white
            
            return transition
        }
        
    }

}
