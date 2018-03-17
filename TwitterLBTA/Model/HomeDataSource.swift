//
//  HomeDataSource.swift
//  TwitterLBTA
//
//  Created by Mayank  Wadhwa on 18/02/18.
//  Copyright © 2018 ShinobiTech. All rights reserved.
//

import LBTAComponents
import SwiftyJSON
import TRON

extension Collection where Iterator.Element == JSON{
    func decode<T>() -> [T] {
        return []
    }
}


class HomeDataSource: Datasource, JSONDecodable{
    
    
    var users: [User]
    
    required init(json: JSON) throws {
        print("Now ready to parse json: \n", json)
        
        guard let usersJsonarray = json["users"].array,  let tweetsJSONArray = json["tweets"].array else {
            throw NSError(domain: "com.mayankwadhwa", code: 1, userInfo: [NSLocalizedDescriptionKey: "Parsing JSON was not valid"])
        }
        
        
//        Below map function return array of objects inside the curly brackets and $0 signify the current object in the array that map function is applied to
        
//        self.users = usersJsonarray.map{User(userJson: $0)}
        
//        Map Function is equivalent to all the below commented lines
//        for userJson in usersJsonarray!{
//            let user = User(userJson: userJson)
//            users.append(user)
//        }
//        self.users = users
        
    
//        self.tweets = tweetsJSONArray.map{Tweet(tweetJson: $0)}
        
//        for tweetJson in tweetsJSONArray! {
//            let tweet = Tweet(tweetJson: tweetJson)
//            tweets.append(tweet)
//        }
        
        self.users = usersJsonarray.decode()
        self.tweets = tweetsJSONArray.decode()
    }

    
    var tweets: [Tweet]
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return  tweets[indexPath.item]
        }
        return users[indexPath.item]
    }

    
    override func numberOfSections() -> Int {
        return 2
    }
    
    
    
}

