//
//  ConfMainViewController.swift
//  IGSHPA
//
//  Created by Mahesh Kumar Kankipati on 1/30/17.
//  Copyright © 2017 srivalli kanchibotla. All rights reserved.
//

import UIKit

class ConfMainViewController: BaseViewController {
    
    @IBOutlet var menuButtonItem: UIBarButtonItem!

    @IBOutlet weak var prgmDetailsBtn: UIButton!
    @IBOutlet weak var scanButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        prgmDetailsBtn.layer.cornerRadius = 5
        scanButton.layer.cornerRadius = 5
    }
}
