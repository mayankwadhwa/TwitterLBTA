//
//  Tweet.swift
//  TwitterLBTA
//
//  Created by Mayank  Wadhwa on 26/02/18.
//  Copyright © 2018 ShinobiTech. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet {
    let user: User
    let message: String
    
    init(tweetJson: JSON) {
        let userJson = tweetJson["user"]
        self.user = User(userJson: userJson)
        self.message = tweetJson["message"].stringValue
    }
}
