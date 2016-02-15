//
//  SidebarMenuViewController.swift
//  DoctorsApp
//
//  Created by Jonathan Decorion on 14/02/2016.
//  Copyright © 2016 Jonathan Decorion. All rights reserved.
//

import UIKit

class SidebarMenuViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var profilePic: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    
    let arrTittiles = ["Profile", "Contacts", "Settings"]
    let arrIcons = ["Administrator Filled-50.png", "Treatment50.png", "Settings-50.png"]
    
    @IBOutlet weak var tableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //set profile pic
        profilePic.image = UIImage(named: "profile.png")
        profilePic.layer.borderWidth = 1
        profilePic.layer.masksToBounds = false
        profilePic.layer.borderColor = UIColor.blackColor().CGColor
        profilePic.layer.cornerRadius = profilePic.frame.height/2
        profilePic.layer.cornerRadius = profilePic.frame.size.width/2
        profilePic.clipsToBounds = true
        
        name.text = "Dr. JDecorion, DScPT, DPM"
        email.text = "jondecorion@gmail.com"
        
        //insert bg at nav
        
        let imageView = UIImageView(frame: CGRectMake(0, 0, 600, 200));
        let image = UIImage(named: "backgroundNB.png");
        imageView.image = image;
        self.view.insertSubview(imageView, atIndex: 0)
        
        
        tableview.dataSource = self
        tableview.delegate = self
        tableview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        //tableview.layoutMargins = UIEdgeInsetsZero;
        
        tableview.separatorStyle = UITableViewCellSeparatorStyle.None
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTittiles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       // let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        if indexPath.row != 2 {
          //  cell.separatorInset = UIEdgeInsetsMake(0, CGRectGetWidth(cell.bounds)/2.0, 0, CGRectGetWidth(cell.bounds)/2.0)
            
        }
        else
        {
            
        }
        
       // (cell.contentView.viewWithTag(100) as! UILabel).text = "" //myarray[indexPath.item]
      //  (cell.contentView.viewWithTag(100) as! UILabel).text  = myarray[indexPath.item]
        
        //cell.viewWithTag(100) = myarray[indexPath.item]
        
        //let lbl = cell.viewWithTag(100) as! UILabel
        //lbl.text = myarray[indexPath.item]
      
        /*
        let image : UIImage = UIImage(named: "Birthday-100.png")!
       
        //cell.imageView!.image = image
        
        let imageView = UIImageView(frame: CGRectMake(10, 3, 35, 35));
        imageView.image = image;
        
        cell.contentView.addSubview(imageView)
        */
        
        //let image : UIImage = UIImage(named: arrIcons[indexPath.item])!
        
       let image : UIImage = resizeImageWithAspect(UIImage(named: arrIcons[indexPath.item])!,scaledToMaxWidth: 25.0, maxHeight: 25.0);
        
        
        cell.imageView!.image = image
        
        cell.imageView!.frame = CGRectOffset(cell.frame, 10, 10);
        
        cell.textLabel?.text = arrTittiles[indexPath.item]
        cell.textLabel!.font = UIFont(name:"Helvetica Neue", size:10)
        cell.textLabel!.textAlignment = NSTextAlignment.Left
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40.0
    }
    
    private func _resizeWithAspect_doResize(image: UIImage,size: CGSize)->UIImage{
        if UIScreen.mainScreen().respondsToSelector("scale"){
            UIGraphicsBeginImageContextWithOptions(size,false,UIScreen.mainScreen().scale);
        }
        else
        {
            UIGraphicsBeginImageContext(size);
        }
        
        image.drawInRect(CGRectMake(0, 0, size.width, size.height));
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return newImage;
    }
    
    func resizeImageWithAspect(image: UIImage,scaledToMaxWidth width:CGFloat,maxHeight height :CGFloat)->UIImage
    {
        let oldWidth = image.size.width;
        let oldHeight = image.size.height;
        
        let scaleFactor = (oldWidth > oldHeight) ? width / oldWidth : height / oldHeight;
        
        let newHeight = oldHeight * scaleFactor;
        let newWidth = oldWidth * scaleFactor;
        let newSize = CGSizeMake(newWidth, newHeight);
        
        return self._resizeWithAspect_doResize(image, size: newSize);
    }
    
    
    /*
    func imageWithImage(image:UIImage,scaledToSize newSize:CGSize)->UIImage{
        
        UIGraphicsBeginImageContext( newSize )
        image.drawInRect(CGRect(x: 0,y: 0,width: newSize.width,height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage.imageWithRenderingMode(.AlwaysTemplate)
    }
    */
    
    /*
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        cell.contentView.backgroundColor = UIColor.clearColor()
        
        let whiteRoundedView : UIView = UIView(frame: CGRectMake(0, 10, self.view.frame.size.width, 120))
        
        whiteRoundedView.layer.backgroundColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), [1.0, 1.0, 1.0, 1.0])
        whiteRoundedView.layer.masksToBounds = false
        whiteRoundedView.layer.cornerRadius = 2.0
        whiteRoundedView.layer.shadowOffset = CGSizeMake(-1, 1)
        whiteRoundedView.layer.shadowOpacity = 0.2
        
        cell.contentView.addSubview(whiteRoundedView)
        cell.contentView.sendSubviewToBack(whiteRoundedView)
    }
    */
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableview.reloadData()
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
