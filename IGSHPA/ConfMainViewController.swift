//
//  ConfMainViewController.swift
//  IGSHPA
//
//  Created by Mahesh Kumar Kankipati on 1/30/17.
//  Copyright © 2017 IGSHPA. All rights reserved.
//

import UIKit

class ConfMainViewController: BaseViewController {
    
    @IBOutlet var menuButtonItem: UIBarButtonItem!

    @IBOutlet weak var ExhibitBtn: UIButton!
    @IBOutlet weak var floorPlan: UIButton!
    @IBOutlet weak var prgmDetailsBtn: UIButton!
    @IBOutlet weak var scanButton: UIButton!
    @IBOutlet weak var confNav: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = UIColor.black
        
        confNav.backBarButtonItem?.title = "Back"
        confNav.backBarButtonItem?.tintColor = UIColor.black
        
        prgmDetailsBtn.layer.cornerRadius = 5
        scanButton.layer.cornerRadius = 5
        ExhibitBtn.layer.cornerRadius = 5
        floorPlan.layer.cornerRadius = 5
        
        /* Used to hide the button after a particular date. 
         
        let currentDate = NSDate()
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        //let convertedDate = dateFormatter.string(from: currentDate as Date)
        let tomorrow = Calendar.current.date(byAdding: .day, value: 22, to: currentDate as Date)
        let futureDate = dateFormatter.string(from: tomorrow! as Date)
        print(futureDate) */
        
        scanButton.isHidden = true
        
    }

    // MARK: - Navigating to different views based on the segue identifiers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "conferenceSegue1"{
            
            let dest = segue.destination as! ConferenceViewController
            dest.cellNo = 0;
            
        }

        if segue.identifier == "programDetailsSegue"{
            
            let dest = segue.destination as! ConferenceViewController
            dest.cellNo = 1;
            
        }
        if segue.identifier == "floorPlanSegue"{
            
            let dest = segue.destination as! ConferenceViewController
            dest.cellNo = 2;
            
        }
        
        
        
        
    }

}
