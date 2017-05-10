//
//  MembershipViewController.swift
//  IGSHPA
//
//  Created by Mahesh Kumar Kankipati on 2/9/17.
//  Copyright © 2017 IGSHPA. All rights reserved.
//

import UIKit

class MembershipViewController: BaseViewController {

    @IBOutlet weak var indvMemBtn: UIButton!
    @IBOutlet weak var corpMemBtn: UIButton!
    override func viewDidLoad() {
        //super.addSlideMenuButton() - Statement to add sliding menu 
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor.black
        corpMemBtn.layer.cornerRadius = 5
        indvMemBtn.layer.cornerRadius = 5
    }

    // MARK: - Navigating to different views based on the segue identifiers

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "commSegue"{
        let dest = segue.destination as! InternalWebLinkViewController
        dest.cellNo = 21
        }
        if segue.identifier == "indvSegue"{
            let dest = segue.destination as! InternalWebLinkViewController
            dest.cellNo = 20
        }
    }
    

}
