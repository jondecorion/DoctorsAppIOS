//
//  RegistrationEndViewController.swift
//  DoctorsApp
//
//  Created by Jonathan Decorion on 27/02/2016.
//  Copyright © 2016 Jonathan Decorion. All rights reserved.
//

import UIKit



class RegistrationEndViewController: UIViewController, UITableViewDataSource,UITableViewDelegate,RegistrationEndTableViewCellDelegate {
    
    var user:CUser!
    
    
    @IBOutlet weak var btnBack: UIButton!
    
    
    @IBOutlet weak var btnSubmit: UIButton!
    
    @IBOutlet weak var table: UITableView!
    
    var imageItems = ["checkbox-checked.png", "checkbox-unchecked.png"]
    var degreeList: NSMutableArray = []
    
     override func viewDidLoad() {
        super.viewDidLoad()

        
        let imageView = UIImageView(frame: CGRectMake(0, 0, 600, 900));
        let image = UIImage(named: "bg101.png");
        imageView.image = image;
        self.view.insertSubview(imageView, atIndex: 0)
        
        if(user != nil)
        {
            var a = CUser()
            a = user
            print(a)
            
            var cd = CDegree()
            cd.id = 1
            cd.name = "Doctor of Audiology"
            cd.abbr = "(AuD)"
            cd.isSelected = false
            degreeList.addObject(cd)
            
            cd = CDegree()
            cd.id = 2
            cd.name = "Doctor of Chiropractic"
            cd.abbr = "(DC)"
            cd.isSelected = false
            degreeList.addObject(cd)
            
            cd = CDegree()
            cd.id = 3
            cd.name = "Doctor of Dental Surgery, Doctor \n" + "of Dental Science"
            cd.abbr = "(DDS)"
            cd.isSelected = false
            degreeList.addObject(cd)
            
            cd = CDegree()
            cd.id = 4
            cd.name = "Doctor of Dental Medicine, Doctor of \n" + "Medical Dentistry"
            cd.abbr = "(DMD)"
            cd.isSelected = false
            degreeList.addObject(cd)
            
            cd = CDegree()
            cd.id = 5
            cd.name = "Doctor of Optometry, Doctor of \n" + "Osteopathic Medicine"
            cd.abbr = "(DO or OD)"
            cd.isSelected = false
            degreeList.addObject(cd)
            
            cd = CDegree()
            cd.id = 6
            cd.name = "Doctor of Podiatric Medicine"
            cd.abbr = "(DPM)"
            cd.isSelected = false
            degreeList.addObject(cd)
            
            cd = CDegree()
            cd.id = 7
            cd.name = "Doctor of Physical Therapy"
            cd.abbr = "(DPT)"
            cd.isSelected = false
            degreeList.addObject(cd)
            
            cd = CDegree()
            cd.id = 8
            cd.name = "Doctor of Science in Physical Therapy"
            cd.abbr = "(DScPT)"
            cd.isSelected = false
            degreeList.addObject(cd)
            
            cd = CDegree()
            cd.id = 9
            cd.name = "Doctor of Science in Nursing"
            cd.abbr = "(DSN)"
            cd.isSelected = false
            degreeList.addObject(cd)
            
            cd = CDegree()
            cd.id = 10
            cd.name = "Doctor of Veterinary Mediciney"
            cd.abbr = "(DVM)"
            cd.isSelected = false
            degreeList.addObject(cd)
            
            
        }
       
        
        table.registerNib(UINib(nibName: "RegistrationEndTableViewCell", bundle: nil),forCellReuseIdentifier: "MyCustomCell")
        
        table.delegate = self
        table.dataSource = self
        
        btnBack.backgroundColor = UIColor.clearColor()
        btnBack.layer.cornerRadius = 8
        btnBack.layer.borderWidth = 1
        btnBack.layer.borderColor = UIColor.blackColor().CGColor
        btnBack.clipsToBounds = true
        
        btnSubmit.backgroundColor = UIColor.clearColor()
        btnSubmit.layer.cornerRadius = 8
        btnSubmit.layer.borderWidth = 1
        btnSubmit.layer.borderColor = UIColor.blackColor().CGColor
        btnSubmit.clipsToBounds = true
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCustomCell") as! RegistrationEndTableViewCell
        
        var  a = CDegree()
        
        let row = indexPath.row
        a = degreeList[row] as! CDegree
        
        cell.name.text = a.name
        cell.abbr.text = a.abbr
        
        cell.setUpWithModel(degreeList[indexPath.row] as! CDegree)
        
        cell.delegate = self
        
        return cell
    }
    
     func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 85
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func didTappedSwitch(cell: RegistrationEndTableViewCell) {
        let indexPath = table.indexPathForCell(cell)
        
        let getSW = degreeList[indexPath!.row] as! CDegree
        getSW.isSelected = cell.sw.on
        
        //degreeList[indexPath!.row].name = cell.sw.on
        
    }
    

   
    
    
    @IBAction func backClicked(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
  
    
    @IBAction func submitClicked(sender: AnyObject) {
        
        //add logic for saving :D
        
        if(user != nil && degreeList.count > 0)
        {
            //objects are ready with data, just need to bind it with the webservice post method
            //for now local storage will be use
             self.navigationController?.popToRootViewControllerAnimated(true)
            
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

