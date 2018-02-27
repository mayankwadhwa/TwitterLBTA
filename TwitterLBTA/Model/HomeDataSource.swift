//
//  HomeDataSource.swift
//  TwitterLBTA
//
//  Created by Mayank  Wadhwa on 18/02/18.
//  Copyright © 2018 ShinobiTech. All rights reserved.
//

import LBTAComponents


class HomeDataSource: Datasource {
    
    let users: [User] = {
        let mayankUser = User(name: "Mayank Wadhwa", username: "@mayankwadhwa19", bioText: "I am just an average guy who waste his time like a below average guy", profileImage: #imageLiteral(resourceName: "twitter-Pic"))
        let manishUser = User(name: "Manish Sharma", username: "@manishsharma", bioText: "I look like a below average joe but don't let my looks fool you because i have a rare ability to not give a fuck about anything", profileImage: #imageLiteral(resourceName: "manish profile pic"))
        
        return [mayankUser, manishUser]
    }()
    
    let tweets: [Tweet] = {
        let mayankUser = User(name: "Mayank Wadhwa", username: "@mayankwadhwa19", bioText: "I am just an average guy who waste his time like a below average guy", profileImage: #imageLiteral(resourceName: "twitter-Pic"))
        let tweet1 = Tweet(user: mayankUser, message:  "This dude sucks")
        let manishUser = User(name: "Manish Sharma", username: "@manishsharma", bioText: "I look like a below average joe but don't let my looks fool you because i have a rare ability to not give a fuck about anything", profileImage: #imageLiteral(resourceName: "manish profile pic"))
        let tweet2 = Tweet(user: manishUser, message: "Mayank Sucks you asshole you could have hold my hand and become a great programmer but you prefer to do pussy hunting at which you miserably failed, while i was able to convince a chick to be my girlfriend even though she hated my guts in first year while you fail to pickup deeksha who might be into you and you don't realise because of your insecurities")
        return [tweet1, tweet2]
    }()
    
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

