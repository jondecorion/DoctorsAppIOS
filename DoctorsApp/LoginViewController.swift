//
//  LoginViewController.swift
//  DoctorsApp
//
//  Created by Jonathan Decorion on 12/02/2016.
//  Copyright © 2016 Jonathan Decorion. All rights reserved.
//

import UIKit
//import @"MyWallViewController.swift"

class LoginViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var email: UITextField!

    @IBOutlet weak var password: UITextField!
    
    
    @IBOutlet weak var btnLogin: UIButton!
    
    
    @IBOutlet weak var btnRegister: UIButton!
    
    
    override func viewDidLoad() {
       super.viewDidLoad()
        
        email.delegate = self
        password.delegate = self;
        
        self.navigationController?.navigationBarHidden = true
        email.borderStyle = UITextBorderStyle.None
        password.borderStyle = UITextBorderStyle.None
        // Do any additional setup after loading the view.
        
        
        //set textbox icons
        let  imageView = UIImageView();
        let  image = UIImage(named: "Administrator Filled-50.png");
        imageView.image = image;
        imageView.frame = CGRectMake(10, 0, 25, 20);
        email.leftView = imageView;
        email.leftViewMode = UITextFieldViewMode.Always
        
        let  imageViewPw = UIImageView();
        let  imagePW = UIImage(named: "Forgot Password Filled-50.png");
        imageViewPw.image = imagePW;
        imageViewPw.frame = CGRectMake(10, 0, 25, 20);
        password.leftView = imageViewPw;
        password.leftViewMode = UITextFieldViewMode.Always
        
        
        //set buttons rounded corner
        btnLogin.backgroundColor = UIColor.clearColor()
        btnLogin.layer.cornerRadius = 8
        btnLogin.layer.borderWidth = 1
        btnLogin.layer.borderColor = UIColor.blackColor().CGColor
        btnLogin.clipsToBounds = true
        
        btnRegister.backgroundColor = UIColor.clearColor()
        btnRegister.layer.cornerRadius = 8
        btnRegister.layer.borderWidth = 1
        btnRegister.layer.borderColor = UIColor.blackColor().CGColor
        btnRegister.clipsToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginClick(sender: AnyObject) {
          performSegueWithIdentifier("loginDashboardSegue", sender: self)
        
    }
    
    
    @IBAction func registerClick(sender: AnyObject) {
    }
   
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //self.view.endEditing(true)
        // return false
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "loginDashboardSegue" {
            if let destinationVC : MyWallViewController = segue.destinationViewController as? MyWallViewController{
                //destinationVC.numberToDisplay = counter
            }
            
        }
        
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
