//
//  AboutusViewController.swift
//  IGSHPA
//
//  Created by Mahesh Kumar Kankipati on 2/22/17.
//  Copyright © 2017 IGSHPA. All rights reserved.
//

import UIKit

class AboutusViewController: BaseViewController {

    @IBOutlet weak var const: UIButton!
    @IBOutlet weak var staff: UIButton!
    @IBOutlet weak var board: UIButton!
    @IBOutlet weak var committee: UIButton!
    @IBOutlet weak var contactus: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        const.layer.cornerRadius = 5
        staff.layer.cornerRadius = 5
        board.layer.cornerRadius = 5
        committee.layer.cornerRadius = 5
        contactus.layer.cornerRadius = 5
        committee.titleLabel?.adjustsFontSizeToFitWidth = true
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "constitutionSegue"{
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 15
        }
        if segue.identifier == "directorsSegue"{
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 16
        }
        if segue.identifier == "committeeSegue"{
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 17
        }
        if segue.identifier == "staffSegue"{
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 18
        }
        if segue.identifier == "contactSegue"{
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 19
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
