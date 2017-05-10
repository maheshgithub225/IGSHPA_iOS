//
//  PubViewController.swift
//  IGSHPA
//
//  Created by Mahesh Kumar Kankipati on 2/24/17.
//  Copyright © 2017 IGSHPA. All rights reserved.
//

import UIKit

class PubViewController: BaseViewController {
    
    @IBOutlet weak var brochuresBtn: UIButton!
    @IBOutlet weak var orderBtn: UIButton!
    @IBOutlet weak var manualsBtn: UIButton!
    @IBOutlet weak var softwareBtn: UIButton!
    @IBOutlet weak var magazine: UIButton!
    @IBOutlet weak var geoOutlook: UIButton!
    @IBOutlet weak var caseStudies: UIButton!
    @IBOutlet weak var forms: UIButton!
    @IBOutlet weak var advertising: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        orderBtn.layer.cornerRadius = 5
        brochuresBtn.layer.cornerRadius = 5
        manualsBtn.layer.cornerRadius = 5
        softwareBtn.layer.cornerRadius = 5
        magazine.layer.cornerRadius = 5
        geoOutlook.layer.cornerRadius = 5
        forms.layer.cornerRadius = 5
        advertising.layer.cornerRadius = 5
        caseStudies.layer.cornerRadius = 5
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigating to different views based on the segue identifiers

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "orderSegue"{
            
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 22;
            
        } else if segue.identifier == "brochureSegue"{
            
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 23;
            
        } else if segue.identifier == "manualSegue"{
            
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 24;
            
        } else if segue.identifier == "softwareSegue"{
            
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 25;
            
        }  else if segue.identifier == "caseStudieSegue"{
            
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 26;
            
        }else if segue.identifier == "magaizineSegue"{
            
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 27;
            
        } else if segue.identifier == "educationalSegue"{
            
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 28;
            
        } else if segue.identifier == "advertisingSegue"{
            
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 29;
            
        } else if segue.identifier == "formSegue"{
            
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 30;
            
        }
    }

}
