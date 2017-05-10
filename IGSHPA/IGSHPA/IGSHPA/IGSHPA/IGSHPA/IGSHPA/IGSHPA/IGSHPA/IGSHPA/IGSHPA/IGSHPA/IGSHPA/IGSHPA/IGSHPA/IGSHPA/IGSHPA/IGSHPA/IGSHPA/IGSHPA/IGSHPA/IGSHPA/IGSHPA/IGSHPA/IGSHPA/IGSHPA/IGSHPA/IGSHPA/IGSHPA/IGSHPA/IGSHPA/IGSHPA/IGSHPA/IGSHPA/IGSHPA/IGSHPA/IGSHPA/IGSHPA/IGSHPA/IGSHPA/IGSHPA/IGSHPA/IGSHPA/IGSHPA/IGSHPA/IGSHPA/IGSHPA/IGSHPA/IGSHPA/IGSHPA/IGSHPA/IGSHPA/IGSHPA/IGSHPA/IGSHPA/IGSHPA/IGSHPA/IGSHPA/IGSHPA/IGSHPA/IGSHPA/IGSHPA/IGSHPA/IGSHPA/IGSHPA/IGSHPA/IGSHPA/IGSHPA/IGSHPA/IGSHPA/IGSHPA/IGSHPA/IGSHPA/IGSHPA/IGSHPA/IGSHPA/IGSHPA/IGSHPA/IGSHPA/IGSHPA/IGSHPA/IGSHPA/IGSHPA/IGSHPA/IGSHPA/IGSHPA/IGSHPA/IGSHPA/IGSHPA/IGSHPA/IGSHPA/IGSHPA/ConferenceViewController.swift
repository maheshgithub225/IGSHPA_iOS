//
//  ConferenceViewController.swift
//  IGSHPA
//
//  Created by Mahesh Kumar Kankipati on 1/30/17.
//  Copyright © 2017 srivalli kanchibotla. All rights reserved.
//

import UIKit

class ConferenceViewController: UIViewController {
    
    @IBOutlet var menuButtonItem: UIBarButtonItem!
    
    @IBOutlet var myWeb: UIWebView!
    var url1: URL!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        url1 = URL(string: "http://conf.igshpa.org/2017")
        print(url1)
        myWeb.scalesPageToFit = true
        myWeb.frame = self.view.bounds
        myWeb.loadRequest(URLRequest(url: url1))
        myWeb.reload()
    }

}
