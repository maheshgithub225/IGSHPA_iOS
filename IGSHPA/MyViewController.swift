//
//  ViewController.swift
//  IGSHPA
//
//  Created by srivalli kanchibotla on 10/26/16.
//  Copyright © 2016 IGSHPA. All rights reserved.
//

import UIKit

class MyViewController: BaseViewController {
   
    @IBOutlet weak var geo: UIButton!
    @IBOutlet weak var dir: UIButton!
    @IBOutlet weak var mem: UIButton!
    @IBOutlet weak var pub: UIButton!
    @IBOutlet weak var conf: UIButton!
    @IBOutlet weak var train: UIButton!
    @IBOutlet weak var standards: UIButton!
    @IBOutlet weak var about: UIButton!
    
    @IBOutlet weak var homeNav: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeNav.title = "Home"
        homeNav.titleView?.tintColor = UIColor.green
        homeNav.hidesBackButton = true
        geo.layer.cornerRadius = 5
        dir.layer.cornerRadius = 5
        mem.layer.cornerRadius = 5
        pub.layer.cornerRadius = 5
        conf.layer.cornerRadius = 5
        train.layer.cornerRadius = 5
        standards.layer.cornerRadius = 5
        about.layer.cornerRadius = 5
    }
    
    @IBAction func pubBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "pubSegue", sender: self)
    }
    
    // MARK: - Navigating to different views based on the segue identifiers
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

       
        if segue.identifier == "directorySegue"{
            
            let dest = segue.destination as! ViewController
            dest.cellNo = 0;
            
        }
        
        if segue.identifier == "standardsSegue"{
            
            let dest = segue.destination as! ViewController
            dest.cellNo = 1;
            
        }
        if segue.identifier == "memberLoginSegue"{
            let dest = segue.destination as! ViewController
            dest.cellNo = 2;
        }
    }
}

