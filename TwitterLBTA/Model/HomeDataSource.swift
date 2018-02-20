//
//  HomeDataSource.swift
//  TwitterLBTA
//
//  Created by Mayank  Wadhwa on 18/02/18.
//  Copyright © 2018 ShinobiTech. All rights reserved.
//

import LBTAComponents



class HomeDataSource: Datasource {
    
    let words = ["user1", "user2", "user3"]
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return words.count
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return words[indexPath.item]
    }
    
}

