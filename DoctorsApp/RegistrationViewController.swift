//
//  RegistrationViewController.swift
//  DoctorsApp
//
//  Created by Jonathan Decorion on 27/02/2016.
//  Copyright © 2016 Jonathan Decorion. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    
    
    @IBOutlet weak var addresee: UITextField!
    @IBOutlet weak var degrees: UITextField!
    @IBOutlet weak var jobDescription: UITextField!
    @IBOutlet weak var fname: UITextField!
    @IBOutlet weak var lname: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var code: UITextField!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var address: UITextField!
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    var user:CUser!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let imageView = UIImageView(frame: CGRectMake(0, 0, 600, 900));
        let image = UIImage(named: "bg101.png");
        imageView.image = image;
        self.view.insertSubview(imageView, atIndex: 0)
        
        
        btnBack.backgroundColor = UIColor.clearColor()
        btnBack.layer.cornerRadius = 8
        btnBack.layer.borderWidth = 1
        btnBack.layer.borderColor = UIColor.blackColor().CGColor
        btnBack.clipsToBounds = true
        
        btnNext.backgroundColor = UIColor.clearColor()
        btnNext.layer.cornerRadius = 8
        btnNext.layer.borderWidth = 1
        btnNext.layer.borderColor = UIColor.blackColor().CGColor
        btnNext.clipsToBounds = true
        
        
    }
    
    
    @IBAction func nextClicked(sender: AnyObject) {
        let  a = CUser()
        a.addresee = addresee.text
        a.degree = degrees.text
        a.jobDescription = jobDescription.text
        a.fname = fname.text
        a.lname = lname.text
        a.email = email.text
        a.password = password.text
        a.areaCode = code.text
        a.phone = number.text
        a.address = address.text
        user = a
        performSegueWithIdentifier("registrationEndSegue", sender: self)

        
    }
    
    @IBAction func backClicked(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
        
        
    }
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
      
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        
        if let segueID = segue.identifier {
            switch segueID {
            case "registrationEndSegue":
               let svc = segue.destinationViewController as! RegistrationEndViewController;
               svc.user = user
                break
            
            default:
                break
            }
            
        }
        
        
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
