//
//  TrainingViewController.swift
//  IGSHPA
//
//  Created by Mahesh Kumar Kankipati on 2/8/17.
//  Copyright © 2017 IGSHPA. All rights reserved.
//

import UIKit

class TrainingViewController: BaseViewController {

    @IBOutlet weak var navTraining: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navTraining.backBarButtonItem?.tintColor = UIColor.black
        navTraining.backBarButtonItem?.title = "Back"
        
        course1.layer.cornerRadius = 5
        course2.layer.cornerRadius = 5
        course3.layer.cornerRadius = 5
        course4.layer.cornerRadius = 5
        course5.layer.cornerRadius = 5
        course9.layer.cornerRadius = 5
        course10.layer.cornerRadius = 5
        course11.layer.cornerRadius = 5
        course12.layer.cornerRadius = 5
        course13.layer.cornerRadius = 5
        courseR1.layer.cornerRadius = 5
        courseR2.layer.cornerRadius = 5
        courseR3.layer.cornerRadius = 5
        course10.titleLabel?.adjustsFontSizeToFitWidth = true
        
    }
    
    @IBOutlet weak var course1: UIButton!
    @IBOutlet weak var course2: UIButton!
    @IBOutlet weak var course3: UIButton!
    @IBOutlet weak var course4: UIButton!
    @IBOutlet weak var course5: UIButton!
    @IBOutlet weak var course9: UIButton!
    @IBOutlet weak var course10: UIButton!
    @IBOutlet weak var course11: UIButton!
    @IBOutlet weak var course12: UIButton!
    @IBOutlet weak var course13: UIButton!
    @IBOutlet weak var courseR1: UIButton!
    @IBOutlet weak var courseR2: UIButton!
    @IBOutlet weak var courseR3: UIButton!
    
    
    // MARK: Navigation to different views based on the segue identifiers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AIW1Segue"{
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 5
        }
        if segue.identifier == "CGD2Segue"{
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 6
        }
        if segue.identifier == "CGI3Segue"{
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 7
        }
        if segue.identifier == "cvcd4Segue"{
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 8
        }
        if segue.identifier == "RGD5Segue"{
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 9
        }
        if segue.identifier == "TTT9Segue"{
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 10
        }
        if segue.identifier == "BLA10Segue"{
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 11
        }
        if segue.identifier == "Resources1Segue"{
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 12
        }
        if segue.identifier == "Resources2Segue"{
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 13
        }
        if segue.identifier == "Resources3Segue"{
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 14
        } else if segue.identifier == "DXinstallerSegue"{
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 31
        }else if segue.identifier == "OpenLoopSegue"{
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 32
        }else if segue.identifier == "GroutingSegue"{
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 33
        }
        
    }
    
}
