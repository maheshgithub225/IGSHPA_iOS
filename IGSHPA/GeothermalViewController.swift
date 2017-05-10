//
//  GeothermalViewController.swift
//  IGSHPA
//
//  Created by Mahesh Kumar Kankipati on 2/8/17.
//  Copyright © 2017 IGSHPA. All rights reserved.
//

import UIKit

class GeothermalViewController: BaseViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = UIColor.black
        geoNav.backBarButtonItem?.title = "Back"
        geoNav.backBarButtonItem?.tintColor = UIColor.black
        
        linksBtn.layer.cornerRadius = 5
        resBtn.layer.cornerRadius = 5
        commercialBtn.layer.cornerRadius = 5
        faqBtn.layer.cornerRadius = 5
        earthInsightsBtn.layer.cornerRadius = 5
    }
    
    @IBOutlet weak var howtoLabel: UILabel!
    @IBOutlet weak var geoNav: UINavigationItem!
    @IBOutlet weak var linksBtn: UIButton!
    @IBOutlet weak var resBtn: UIButton!
    @IBOutlet weak var commercialBtn: UIButton!
    @IBOutlet weak var faqBtn: UIButton!
    @IBOutlet weak var earthInsightsBtn: UIButton!

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "residentialSegue"{
            
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 0;
            
        } else if segue.identifier == "commercialSegue"{
            
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 1;
            
        } else if segue.identifier == "faqSegue"{
            
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 2;
            
        } else if segue.identifier == "earthInsightsSegue"{
            
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 3;
            
        } else if segue.identifier == "linksSegue"{
            
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 4;
            
        }
    }
 

}
