
//
//  WelcomeViewController.swift
//  IGSHPA
//
//  Created by srivalli kanchibotla on 11/16/16.
//  Copyright © 2016 IGSHPA. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController,UPStackMenuItemDelegate {
    
    
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var createdAt: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    
    var names:String!
    var lname: String!
    var createdLabel:String!
    var createdDate:NSDate!
    var arrayVal : NSArray = NSArray()
    let dest1 = CertificateViewController()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        firstNameLabel.text = names
        lastNameLabel.text = lname
        createdAt.text = createdLabel
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigating to different views based on the segue identifiers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "certificateSegue"{
            if let dest = segue.destination as? CertificateViewController{
                print("first name is \(self.firstNameLabel.text)")
                dest.firstName = self.firstNameLabel.text!
                dest.lastName = self.lastNameLabel.text!
            }
        }
    }
}
