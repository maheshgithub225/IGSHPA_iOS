//
//  DirectoryViewController.swift
//  IGSHPA
//
//  Created by Mahesh Kumar Kankipati on 2/27/17.
//  Copyright © 2017 IGSHPA. All rights reserved.
//

import UIKit
import SystemConfiguration

class DirectoryViewController: BaseViewController {

    
    @IBOutlet var myWeb: UIWebView!
    var url1: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = UIColor.black
        
            url1 = URL(string:"http://www.igshpa.org/directory/")
            print(url1)
        
        // Setting up the web view
            myWeb.scalesPageToFit = true
            myWeb.frame = self.view.bounds
            myWeb.loadRequest(URLRequest(url: url1))
            myWeb.reload()
        
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
                self.performSegue(withIdentifier: "home1Segue", sender: self)
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
