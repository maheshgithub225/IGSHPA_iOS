//
//  ScannerViewController.swift
//  IGSHPA
//
//  Created by Mahesh Kumar Kankipati  on 1/8/17.
//  Copyright © 2017 IGSHPA All rights reserved.
//

import UIKit
import AVFoundation
import Contacts
import ContactsUI

@available(iOS 9.0, *)
class ScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate, CNContactPickerDelegate
{
    /// Declaring variables required for capturing the object
    var objCaptureSession:AVCaptureSession?
    var objCaptureVideoPreviewLayer:AVCaptureVideoPreviewLayer?
    var vwQRCode:UIView?
    
    /// Declaring JSON dictonary to store all the data that is received from the QR Code
    var json : NSDictionary = NSDictionary()
    
    var store = CNContactStore()
    var flag = false
    
    /// Initialization of Contact data variables
    var homeNumber = ""
    var workNumber = ""
    var F_Name = ""
    var L_Name = ""
    var EmailAddress = ""
    var Suffix = ""
    var Prefix = ""
    var Title1 = ""
    var company = ""
    var Nickname = ""
    var Initial = ""
    var websiteUrl = ""
    var attendeeType = ""
    var fax = ""
    var address = ""
    var state = ""
    var city = ""
    var country = ""
    var zipcode = ""
    var message = ""
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureVideoCapture()
        self.addVideoPreviewLayer()
        self.initializeQRView()
        self.navigationController?.navigationBar.tintColor = UIColor.black
        
    }
    
    /// Configuring Video Capture in Device after reading QRCode
    func configureVideoCapture() {
        
        // Initializing a device object and provide that as the media type parameter using AVCaptureDevice class
        let objCaptureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        var error:NSError?
        let objCaptureDeviceInput: AnyObject!
        do {
            objCaptureDeviceInput = try AVCaptureDeviceInput(device: objCaptureDevice) as AVCaptureDeviceInput
            
        } catch let error1 as NSError {
            error = error1
            objCaptureDeviceInput = nil
        }
        if (error != nil) {
            let alertView:UIAlertView = UIAlertView(title: "Device Error", message:"Device not Supported for this Application", delegate: nil, cancelButtonTitle: "Ok Done")
            alertView.show()
            return
        }
        objCaptureSession = AVCaptureSession()
        objCaptureSession?.addInput(objCaptureDeviceInput as! AVCaptureInput)
        let objCaptureMetadataOutput = AVCaptureMetadataOutput()
        objCaptureSession?.addOutput(objCaptureMetadataOutput)
        objCaptureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        objCaptureMetadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
    }
    
    /// Adds video preview layer in device
    func addVideoPreviewLayer() {
        objCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: objCaptureSession)
        objCaptureVideoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        objCaptureVideoPreviewLayer?.frame = view.layer.bounds
        self.view.layer.addSublayer(objCaptureVideoPreviewLayer!)
        objCaptureSession?.startRunning()
    }
    
    /// Initialization of QR Code review
    func initializeQRView() {
        vwQRCode = UIView()
        vwQRCode?.layer.borderColor = UIColor.red.cgColor
        vwQRCode?.layer.borderWidth = 5
        self.view.addSubview(vwQRCode!)
        self.view.bringSubview(toFront: vwQRCode!)
    }
    
    /// Implemented AVCaptureMetadataOutputObjectsDelegate that can be used to capture the output in the vide player
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        
        if metadataObjects == nil || metadataObjects.count == 0 {
            vwQRCode?.frame = CGRect.zero
            return
        }
        let objMetadataMachineReadableCodeObject = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if objMetadataMachineReadableCodeObject.type == AVMetadataObjectTypeQRCode {
            let objBarCode = objCaptureVideoPreviewLayer?.transformedMetadataObject(for: objMetadataMachineReadableCodeObject as AVMetadataMachineReadableCodeObject) as! AVMetadataMachineReadableCodeObject
            print(objBarCode)
            
            
            let alertView2 = UIAlertController(title: "Wrong QR Code Detected", message: "Please scan IGSHPA QR Code", preferredStyle: .alert)
            alertView2.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.destructive, handler: { _ in
                self.viewDidLoad()
            }))
            
            
            let alertView1 = UIAlertController(title: "Contact Saved to phone", message: "", preferredStyle: .alert)
            alertView1.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.destructive, handler: { _ in
                self.performSegue(withIdentifier: "scannerSegue", sender: self)
            }))
            
            let alertView = UIAlertController(title: "Would you like to save", message: "", preferredStyle: .alert)
            
            alertView.addAction(UIAlertAction(title:"No", style:UIAlertActionStyle.destructive,handler: { _ in
                self.viewDidLoad()
            }))
            
            alertView.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.destructive, handler: { _ in
                self.saveContact()
                self.present(alertView1, animated: true, completion: nil)
                
            }))
            
            vwQRCode?.frame = objBarCode.bounds;
            
            if objMetadataMachineReadableCodeObject.stringValue != nil {
                let str = objMetadataMachineReadableCodeObject.stringValue!
                let data = str.data(using: String.Encoding.utf8, allowLossyConversion: false)!
                print(data)
                do {
                    let object = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments)
                    
                    if let dictionary = object as? [String: AnyObject] {
                        
                        self.F_Name = dictionary["firstName"] as! String
                        self.L_Name = dictionary["lastName"] as! String
                        if let home = dictionary["phone1"] as? String{
                            self.homeNumber = home
                        }
                        if let work = dictionary["phone2"] as? String{
                            self.workNumber = work
                        }
                        if let email = dictionary["email"] as? String{
                            self.EmailAddress = email
                        }
                        if let company1 = dictionary["company"] as? String {
                            self.company = company1
                        }
                        if let nickname = dictionary["nickName"] as? String {
                            self.Nickname = nickname
                        }
                        if let title = dictionary["title"] as? String{
                            self.Title1 = title
                        }
                        if let prefix = dictionary["prefix"] as? String{
                            self.Prefix = prefix
                        }
                        if let suffix = dictionary["suffix"] as? String{
                            self.Suffix = suffix
                        }
                        if let initial = dictionary["initial"] as? String{
                            self.Initial = initial
                        }
                        if let fax = dictionary["fax"] as? String{
                            self.fax = fax
                        }
                        if let attendee = dictionary["attendeeType"] as? String{
                            self.attendeeType = attendee
                        }
                        if let website = dictionary["website"] as? String{
                            self.websiteUrl = website
                        }
                        if let addr = dictionary["address"] as? String{
                            self.address =  addr
                        }
                        if let city1 = dictionary["city"] as? String{
                            self.city = city1
                        }
                        if let country1 = dictionary["country"] as? String{
                            self.country = country1
                        }
                        if let state1 = dictionary["state"] as? String{
                            self.state = state1
                        }
                        if let zipcode1 = dictionary["zip"] as? String{
                            self.zipcode = zipcode1
                        }
                        
                        
                        
                        if self.F_Name != " " || self.L_Name != " " {
                            
                            alertView.message = self.F_Name + " " + self.L_Name
                            self.present(alertView, animated: true, completion: nil)
                        }
                    }else {
                        self.present(alertView2, animated: true, completion: nil)
                    }
                } catch {
                    self.present(alertView2, animated: true, completion: nil) // Handle Error
                }
                self.objCaptureSession?.stopRunning()
            }
        }
    }
    
    /// Saving the contact to the device
    func saveContact(){
        
        // Alert that pops up if contact already exists.
        let alertView3 = UIAlertController(title: "Contact already exists", message: "", preferredStyle: .alert)
        alertView3.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.destructive, handler: { _ in
            self.viewDidLoad()
        }))

        /// Initialization of mutable contact object
        let newContact = CNMutableContact()
        
        /// Assigning the parsed json data to the mutablecontact object
        newContact.givenName = self.F_Name
        newContact.familyName = self.L_Name
        newContact.middleName = self.Initial
        newContact.jobTitle = self.Title1
        newContact.nameSuffix = self.Suffix
        newContact.namePrefix = self.Prefix
        newContact.note = self.attendeeType
        newContact.organizationName = self.company
        newContact.urlAddresses = [CNLabeledValue(label: CNLabelURLAddressHomePage, value: (stringValue:self.websiteUrl) as NSString)]
        
        let homeAddress = CNMutablePostalAddress()
        homeAddress.street = self.address
        homeAddress.city = self.city
        homeAddress.state = self.state
        homeAddress.postalCode = self.zipcode
        newContact.postalAddresses = [CNLabeledValue(label:CNLabelHome, value:homeAddress)]
        
        newContact.phoneNumbers = [CNLabeledValue(
            label:CNLabelPhoneNumberiPhone,
            value:CNPhoneNumber(stringValue: self.homeNumber)),
                                   CNLabeledValue(
                                    label:CNLabelPhoneNumberiPhone,
                                    value:CNPhoneNumber(stringValue:self.workNumber))]
        
        let workEmail = CNLabeledValue(label: CNLabelWork, value: (self.EmailAddress) as NSString)
        newContact.emailAddresses = [workEmail]
        
        do {
            let saveRequest = CNSaveRequest()
            let pred = CNContact.predicateForContacts(matchingName: "\(self.L_Name)")
            let toFetch = [CNContactGivenNameKey, CNContactFamilyNameKey]
            do{
                let contacts = try store.unifiedContacts(
                    matching: pred, keysToFetch: toFetch as [CNKeyDescriptor])
                
                if contacts.isEmpty{
                    saveRequest.add(newContact, toContainerWithIdentifier: nil)
                    try AppDelegate.getAppDelegate().contactStore.execute(saveRequest)
                }else {
                    self.present(alertView3, animated: true, completion: nil)
                }
                
                
            } catch let err{
                print(err)
            }
        }
        catch {
            AppDelegate.getAppDelegate().showMessage("Unable to save the new contact.")
        }
    }
}

