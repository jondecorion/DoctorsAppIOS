//
//  CActivities.swift
//  DoctorsApp
//
//  Created by Jonathan Decorion on 16/02/2016.
//  Copyright © 2016 Jonathan Decorion. All rights reserved.
//

import UIKit

import Alamofire
class CActivities: NSObject {
    var id: Int32?
    var profile: String?
    var name: String?
    var time: String?
    var title: String?
    var image: String?
    var comment: String?
    var likes: String?
    
    var userId:Int32?
    var hasImage:Bool?
    var postBody:String?
    var postImage:String?//file equivalent
    var postTitle:String?
    var profileName:String?
    var profileOwner:String?
    var dateCreated:String?
    var dateUpdated:String?
    var acl:String?

}
