//
//  SideBarTableViewController.swift
//  IGSHPA
//
//  Created by srivalli kanchibotla on 10/26/16.
//  Copyright © 2016 srivalli kanchibotla. All rights reserved.
//
import WebKit
import UIKit


class SideBarTableViewController: UITableViewController,WKNavigationDelegate{
    var menuItems = ["Home","Geothermal","Training","Conference","Membership","Publications","Business Directory"]
    var urlItems = ["http://www.igshpa.okstate.edu/", "file:///Users/srivallikanchibotla/Downloads/webIGSHPA/geothermal.html", "file:///Users/srivallikanchibotla/Desktop/Apps/webIGSHPA/training.html", "http://www.igshpa.okstate.edu/conf/", "http://www.igshpa.okstate.edu/membership/", "http://www.igshpa.okstate.edu/publication/", "http://www.igshpa.okstate.edu/directory/"]

    var webView = WKWebView()
    var gradientLayer: CAGradientLayer!
    var x = " "
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        cell.backgroundView?.frame(forAlignmentRect: cell.bounds)
        
        cell.backgroundView = UIImageView(image: #imageLiteral(resourceName: "menuImage.png"))
        cell.textLabel?.backgroundColor = UIColor.clear
        cell.textLabel?.isOpaque = false
        cell.textLabel?.text = menuItems[indexPath.row]
        cell.textLabel?.textColor = UIColor.white

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let currentCell = tableView.cellForRow(at: indexPath) as UITableViewCell!
        
         x = (currentCell?.textLabel?.text)!
        if x.contains("Geothermal") || x.contains("Directory") || x.contains("Membership") || x.contains("Publication") || x.contains("Training") || x.contains("Conference") {
            //self.performSegue(withIdentifier: "webSegue", sender: self)
            
            
        }else{
        self.performSegue(withIdentifier: "homeSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "webSegue"{
            
          let nav = segue.destination as! UINavigationController
            let indexpath1 = self.tableView.indexPathForSelectedRow
          
            let dest = nav.topViewController as! ViewController

            dest.cellNo = (indexpath1?.row)!
            
            print("selected cell is \(menuItems[(indexpath1?.row)!]) and \(indexpath1?.row)")
            
       }
    }
}
