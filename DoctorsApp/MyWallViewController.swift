//
//  MyWallViewController.swift
//  DoctorsApp
//
//  Created by Jonathan Decorion on 14/02/2016.
//  Copyright © 2016 Jonathan Decorion. All rights reserved.
//

import UIKit

import Alamofire

class MyWallViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var menu: UIBarButtonItem!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var position: UILabel!
    
    
    @IBOutlet weak var table: UITableView!
  
    let cActivities: NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        
       if revealViewController() != nil {
        menu.target = revealViewController()
        menu.action = "revealToggle:"
        
        //revealViewController().rightViewRevealWidth = 150
        //extraButton.target = revealViewController()
        //extraButton.action = "rightRevealToggle:"
        
         view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
       }
        
        var imageView = UIImageView(frame: CGRectMake(0, 0, 600, 210));
        var image = UIImage(named: "backgroundNB.png");
        imageView.image = image;
        self.view.insertSubview(imageView, atIndex: 0)
        
        
        
        imageView = UIImageView(frame: CGRectMake(0, 280, 600, 600));
        image = UIImage(named: "myWallBG.png");
        imageView.image = image;
        self.view.insertSubview(imageView, atIndex: 0)
        
        //set profile pic
        profilePic.image = UIImage(named: "profile.png")
        profilePic.layer.borderWidth = 1
        profilePic.layer.masksToBounds = false
        profilePic.layer.borderColor = UIColor.blackColor().CGColor
        profilePic.layer.cornerRadius = profilePic.frame.height/2
        profilePic.layer.cornerRadius = profilePic.frame.size.width/2
        profilePic.clipsToBounds = true
        
        name.text = "Dr. JDecorion, DScPT, DPM"
        position.text = "Senior Consultant Surgeon"
        
        
        //to do need to bind with the webservice data
        var  a = CActivities()
        a.id = 1
        a.name = "Dr. JDecorion, DScPT, DPM"
        a.time = "07:05 PM"
        a.profile = "profile.png"
        a.image = "cake-1.png"
        a.title = "Cake Time"
        a.comment = "I love it"
        
        cActivities.addObject(a)
        a = CActivities()
        a.id = 2
        a.name = "Dr. Pedro Pendoco, DScPT, DPM"
        a.time = "07:05 PM"
        a.profile = "profile.png"
        a.image = "cake-1.png"
        a.title = "Cake Time"
        a.comment = "I love it"
        cActivities.addObject(a)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cActivities.count
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MyWallTableViewCell
        
        var  a = CActivities()
        
        let row = indexPath.row
        a = cActivities[row] as! CActivities
        
        cell.profile!.image = UIImage(named: a.profile!)
        cell.img!.image = UIImage(named: a.image!)
        
        cell.imageView!.frame = CGRectOffset(cell.frame, 10, 10);
        
        cell.name.text = a.name!
        cell.position.text = a.time!
        cell.title.text = a.title!
        cell.comment.text = a.comment!
                
        return cell
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
