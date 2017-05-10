//
//  GeothermalViewController.swift
//  IGSHPA
//
//  Created by Mahesh Kumar Kankipati on 2/8/17.
//  Copyright © 2017 srivalli kanchibotla. All rights reserved.
//

import UIKit

class GeothermalViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        linksBtn.layer.cornerRadius = 5
        resBtn.layer.cornerRadius = 5
        commercialBtn.layer.cornerRadius = 5
        faqBtn.layer.cornerRadius = 5
        earthInsightsBtn.layer.cornerRadius = 5
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var howtoLabel: UILabel!
    @IBAction func residentialBtn(_ sender: Any) {
        //self.performSegue(withIdentifier: "residentialSegue", sender: self)
    }
    @IBAction func commercialBtn(_ sender: Any) {
       // self.performSegue(withIdentifier: "commercialSegue", sender: self)
    }
    @IBAction func FAQbtn(_ sender: Any) {
        //self.performSegue(withIdentifier: "faqSegue", sender: self)
    }
    @IBAction func earthInsights(_ sender: Any) {
        //self.performSegue(withIdentifier: "earthInsightsSegue", sender: self)
    }
    @IBAction func linksBtn1(_ sender: Any) {
         //self.performSegue(withIdentifier: "linksSegue", sender: self)
    }
    @IBOutlet weak var linksBtn: UIButton!
    
    @IBOutlet weak var resBtn: UIButton!
    @IBOutlet weak var commercialBtn: UIButton!
    @IBOutlet weak var faqBtn: UIButton!
    @IBOutlet weak var earthInsightsBtn: UIButton!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
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
