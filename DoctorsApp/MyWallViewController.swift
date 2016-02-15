//
//  MyWallViewController.swift
//  DoctorsApp
//
//  Created by Jonathan Decorion on 14/02/2016.
//  Copyright © 2016 Jonathan Decorion. All rights reserved.
//

import UIKit

class MyWallViewController: UIViewController {
    
    
    @IBOutlet weak var menu: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        let button = UIButton()
        //set image for button
        button.setImage(UIImage(named: "menu.png"), forState: UIControlState.Normal)
        //add function for button
        button.addTarget(self, action: "menuPressed", forControlEvents: UIControlEvents.TouchUpInside)
        //set frame
        button.frame = CGRectMake(0, 0, 53, 31)
        
        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        self.navigationItem.leftBarButtonItem = barButton
        */
        
        
       if revealViewController() != nil {
        menu.target = revealViewController()
        menu.action = "revealToggle:"
        
        //revealViewController().rightViewRevealWidth = 150
        //extraButton.target = revealViewController()
        //extraButton.action = "rightRevealToggle:"
        
         view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
       }
        
        /*
        if revealViewController() != nil {
            //            revealViewController().rearViewRevealWidth = 62
            menuButton.target = revealViewController()
            menuButton.action = "revealToggle:"
            
            revealViewController().rightViewRevealWidth = 150
            extraButton.target = revealViewController()
            extraButton.action = "rightRevealToggle:"
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            
        }
        */
        

        // Do any additional setup after loading the view.
    }
    
    func menuPressed() {
        
        //println("Share to fb")
        
        //revealViewController().rearViewRevealWidth = 62
        //revealViewController().revealToggleAnimated = true
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
