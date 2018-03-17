//
//  Users.swift
//  TwitterLBTA
//
//  Created by Mayank  Wadhwa on 20/02/18.
//  Copyright © 2018 ShinobiTech. All rights reserved.
//

import UIKit
import SwiftyJSON
//Struct is easy to use and automatically gives the constructor for the struct object
struct User {
    let name: String
    let username: String
    let bioText: String
    let profileImageUrl: String
    
    init(userJson: JSON) {
        self.username =  userJson["username"].stringValue
        self.name = userJson["name"].stringValue
        self.bioText = userJson["bio"].stringValue
        self.profileImageUrl = userJson["profileImageUrl"].stringValue
    }
}
