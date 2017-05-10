//
//  LoginViewController.swift
//  IGSHPA
//
//  Created by srivalli kanchibotla on 11/11/16.
//  Copyright © 2016 IGSHPA. All rights reserved.
//
/// This controller is not in use currently with this app. If we need the login page we need use this viewcontroller

import UIKit

class LoginViewController: BaseViewController,UITextFieldDelegate, URLSessionDataDelegate {

    @IBAction func frgtPwd(_ sender: AnyObject) {
    }
    @IBOutlet var loginIndicator: UIActivityIndicatorView!
    @IBOutlet var logoImage: UIImageView!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var passwordTextField: UITextField!
    var responseData:NSString!
    var createdAt:String!
    var firstname: String!
    var responseDictionary:NSDictionary!
    var lastname: String!
    var x = ""
    var flag = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ field: UITextField) -> Bool
    {
        field.resignFirstResponder()
        return true
    }

    func popAlert(text: String) -> Void
    {
        let noSave = UIAlertController(title: "Cannot Save", message: text, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (result: UIAlertAction) in
            
        }
        noSave.addAction(action)
        
        self.present(noSave, animated: true, completion: nil)
    }
    func welcomeAlert(text: String) -> Void
    {
        let welcome = UIAlertController(title: "Login Successful!!!", message: text, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (result: UIAlertAction) in
            
        }
        welcome.addAction(action)
        
        self.present(welcome, animated: true, completion: nil)
    }
    @IBAction func loginButton(_ sender: Any) {
        var alertText = ""
        if (userNameTextField.text?.isEmpty)! {
            alertText += "Username cannot be empty"
        }
        if (passwordTextField?.text?.isEmpty)! {
            alertText += "Password cannot be empty"
        }

        if !(alertText.isEmpty) {
            popAlert(text: alertText)
        }
        else{
            let request = NSMutableURLRequest(url: NSURL(string: "https://cs.okstate.edu/~srivall/IGSHPA_login.php") as! URL)
            request.httpMethod = "POST"
            let postString = "username=\(userNameTextField.text!)&password=\(passwordTextField.text!)"
           
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-type")
            request.httpBody = postString.data(using: String.Encoding.utf8)
            let task = URLSession.shared.dataTask(with: request as URLRequest){data, response, error in
                guard error == nil else {
                    print("error=\(error)")

                    return
                }
                  self.responseData =  NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                                print("responseString= \(self.responseData)")
                let x = self.responseData.data(using: String.Encoding.utf8.rawValue)
                    if(self.responseData.contains("wrong username")){
                        DispatchQueue.main.async {
                            self.popAlert(text: "Username and password do not match the records!Try again")
                        }                    
                    }
                    else{
                self.responseDictionary = try! JSONSerialization.jsonObject(with: x! as Data, options: .allowFragments) as! NSDictionary
                print(self.responseDictionary)
                self.firstname = self.responseDictionary.value(forKey: "first_name") as! String!
                 self.lastname = self.responseDictionary.value(forKey: "last_name") as! String!
                self.createdAt = self.responseDictionary.value(forKey: "created_at") as! String!
                print(self.firstname)
                if !self.firstname.isEmpty{
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "loginSegue", sender: self)
                    }
                
               }
                }
                
            }
            task.resume()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginSegue"{
            if let dest = segue.destination as? WelcomeViewController{
                print("first name is \(self.firstname)")
                dest.names = self.firstname
                dest.lname = (self.lastname)
                dest.createdLabel = createdAt
            }
        }
    }
}
