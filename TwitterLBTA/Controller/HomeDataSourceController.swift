//
//  HomeDataSourceController.swift
//  TwitterLBTA
//
//  Created by Mayank  Wadhwa on 16/02/18.
//  Copyright © 2018 ShinobiTech. All rights reserved.
//

import LBTAComponents


class HomeDataSourceController: DatasourceController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeDataSource = HomeDataSource()
        self.datasource = homeDataSource
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
}
