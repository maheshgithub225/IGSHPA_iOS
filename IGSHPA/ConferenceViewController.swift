//
//  ConferenceViewController.swift
//  IGSHPA
//
//  Created by Mahesh Kumar Kankipati on 1/30/17.
//  Copyright © 2017 IGSHPA. All rights reserved.
//

import UIKit
import SystemConfiguration

class ConferenceViewController: UIViewController {
    
    
    @IBOutlet var myWeb: UIWebView!
    var url1: URL!
    var selectedCell = " "
    var cellNo = 0
    var urlItems = [
        "http://igshpa.org/conference",
        "http://igshpaconference.com/2017/",
        "http://www.igshpa.okstate.edu/pdf_files/2017_conf/Floorplan.pdf"
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        url1 = URL(string: urlItems[cellNo])
       navigationController?.navigationBar.tintColor = UIColor.black
        print(url1)
        myWeb.scalesPageToFit = true
        myWeb.frame = self.view.bounds
        myWeb.loadRequest(URLRequest(url: url1))
        myWeb.reload()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        // ViewControllers view ist fully loaded and could present further ViewController
        //Here you could do any other UI operations
        if Reachability.isConnectedToNetwork() == true
        {
            print("Connected")
        }
        else
        {
            let controller = UIAlertController(title: "No Internet Detected", message: "Please check your Internet connection", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Retry", style: .default, handler: {_ in
                self.viewDidLoad()
                self.viewDidAppear(true)
            })
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler:{_ in
                _ = self.navigationController?.popViewController(animated: true)
            })
            
            controller.addAction(ok)
            controller.addAction(cancel)
            
            present(controller, animated: true, completion: nil)
        }
        
    }
    public class Reachability {
        class func isConnectedToNetwork() -> Bool {
            var zeroAddress = sockaddr_in()
            zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
            zeroAddress.sin_family = sa_family_t(AF_INET)
            let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
                $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                    SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
                }
            }
            var flags = SCNetworkReachabilityFlags()
            if !SCNetworkReachabilityGetFlags(defaultRouteReachability! , &flags) {
                return false
            }
            let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
            let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
            return (isReachable && !needsConnection)
        }
    }
    
    
}
