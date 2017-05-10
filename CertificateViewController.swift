//
//  CertificateViewController.swift
//  IGSHPA
//
//  Created by srivalli kanchibotla on 11/28/16.
//  Copyright © 2016 IGSHPA. All rights reserved.
//

import UIKit
import Foundation
import WebKit

class CertificateViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,URLSessionDataDelegate{
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var certTable: UITableView!
    var firstName:String = ""
    var lastName:String = ""
    var values1 = NSArray()
    let certURL = "https://cs.okstate.edu/~srivall/IGSHPA_certifications.php"
    var result:NSString!
    
    struct certificates{
        let C_ID: Int
        let C1_ID: Int
        let Date: String
    }
    var cerArray = [certificates]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        get()
        certTable.delegate = self
        certTable.dataSource = self
        certTable.reloadData()
        
        titleLabel.text = "\(firstName), \(lastName) is certified as"
        }
    
    
    func get(){
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://cs.okstate.edu/~srivall/IGSHPA_certifications.php") as! URL)
        request.httpMethod = "POST"
        let postString = "lastName=\(lastName)&firstName=\(firstName)"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-type")
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){data, response, error in
            guard error == nil else {
                print("error=\(error)")
                return
            }
            guard let responseData = data else{
                print("Error: did not receive data")
                return
            }
            do{
                let values = try! JSONSerialization.jsonObject(with: responseData as Data, options: .allowFragments) as! NSArray
                
                print("\(values)")
                self.values1 = values
                self.certTable.dataSource = self
                DispatchQueue.main.async{
                    self.certTable.reloadData()
                }
            }
            
        }
        task.resume()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.values1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "certCell", for: indexPath)
        let maindata = self.values1[indexPath.row] as! NSDictionary
        print(maindata)
        var appendText = maindata["certification_level_id"] as? String
        if appendText == "1" {
            appendText = "Accredited Installer"
        }
        else if appendText == "2" {
            appendText = "Horizontal Loop Installer"
        }
        else if appendText == "3" {
            appendText = "Vertical Loop Installer"
        }
        else if appendText == "4" {
            appendText = "Train the trainer"
        }
        else if appendText == "5" {
            appendText = "Certified GeoExchange Designer"
        }
        else if appendText == "6" {
            appendText = "GEO Inspector"
        }
        else if appendText == "7" {
            appendText = "Certified vertical closed looop Driller"
        }
        else  if appendText == "8" {
            appendText = "GEO Inspector - In training"
        }
        else{
            appendText = "None"
        }
        let appendText1 = appendText?.appending("  by  ")
        var temp = maindata["certification_accreditor_id"] as! String
        if temp == "3" {
            temp = "IGSHPA"
        }
        else if temp == "4"{
            temp = "AEE"
        }
        else if temp == "5"{
            temp = "NGWA"
        }
        
        cell.textLabel?.text = appendText1?.appending(temp)
        cell.detailTextLabel?.text = "Expires on: \(maindata["expires_on"] as! String)"
        
        certTable.reloadRows(at: [indexPath], with: UITableViewRowAnimation.bottom)
        return cell
    }
}
