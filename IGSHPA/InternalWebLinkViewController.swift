//
//  InternalWebLinkViewController.swift
//  IGSHPA
//
//  Created by Mahesh Kumar Kankipati on 2/10/17.
//  Copyright © 2017 IGSHPA All rights reserved.
//

import UIKit
import SystemConfiguration

class InternalWebLinkViewController: UIViewController {
    
    @IBOutlet weak var intwebNav: UINavigationItem!
    var url1 : URL!
    var cellNo = 0
    var UrlItems = ["http://igshpa.org/geothermal#residential",
                    "http://igshpa.org/geothermal#commercial",
                    "http://igshpa.org/frequently-asked-questions",
                    "http://igshpa.org/earth-insights",
                    "http://igshpa.org/links",
                    "http://igshpa.org/accredited-installer-workshops",
                    "http://igshpa.org/certified-geoexchange-designer",
                    "http://igshpa.org/certified-geothermal-inspector",
                    "http://igshpa.org/certified-vertical-closed-loop-driller-prep",
                    "http://igshpa.org/certified-residential-geothermal-designer",
                    "http://igshpa.org/train-trainer-course",
                    "http://igshpa.org/short-courses",
                    "http://igshpa.org/accreditation-renewal-information",
                    "http://igshpa.org/training-events",
                    "http://igshpa.org/accredited-trainers",
                    "http://igshpa.org/constitution-and-bylaws",
                    "http://igshpa.org/board-directors",
                    "http://igshpa.org/advisory-committee-and-council-chairs",
                    "http://igshpa.org/meet-staff",
                    "http://igshpa.org/contact-us",
                    "http://igshpa.org/individual-membership",
                    "http://igshpa.org/corporate-membership",
                    "https://secure.touchnet.com/C20271_ustores/web/store_main.jsp?STOREID=33",
                    "http://igshpa.org/brochures-and-booklets",
                    "http://igshpa.org/manuals",
                    "http://igshpa.org/software",
                    "http://igshpa.org/case-studies",
                    "http://www.geooutlook.org",
                    "http://igshpa.org/educational-outreach",
                    "http://igshpa.org/advertising-opportunities",
                    "http://igshpa.org/downloadable-forms",
                    "http://igshpa.org/short-courses#certified-dx-installer-course",
                    "http://igshpa.org/short-courses#open-loop-geothermal-systems",
                    "http://igshpa.org/short-courses#understanding-grouting-applications--innovations"]
    
    
    @IBOutlet weak var webView2: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = UIColor.black
        
        url1 = URL(string: UrlItems[cellNo])
        
        // Initializing webview
        webView2.scalesPageToFit = true
        webView2.frame = self.view.bounds
        webView2.loadRequest(URLRequest(url: url1))
        webView2.reload()
    }
    
    // Checks for internet connectivity before the view appears on the device
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
