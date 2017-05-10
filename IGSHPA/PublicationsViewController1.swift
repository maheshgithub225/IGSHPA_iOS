//
//  PublicationsViewController.swift
//  IGSHPA
//
//  Created by Mahesh Kumar Kankipati on 2/24/17.
//  Copyright © 2017 IGSHPA. All rights reserved.
//

import UIKit

class PublicationsViewController: UIViewController {

    @IBOutlet weak var brochuresBtn: UIButton!
    @IBOutlet weak var orderBtn: UIButton!
    @IBOutlet weak var manualsBtn: UIButton!
    
    @IBOutlet weak var softwareBtn: UIButton!
    
    @IBOutlet weak var magazine: UIButton!
    @IBOutlet weak var geoOutlook: UIButton!
    
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
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
   

}
