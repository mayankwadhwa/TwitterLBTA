//
//  HomeDataSourceController.swift
//  TwitterLBTA
//
//  Created by Mayank  Wadhwa on 16/02/18.
//  Copyright © 2018 ShinobiTech. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON


class HomeDataSourceController: DatasourceController{
    
    let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Apologies something went wrong. Please try again later..."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(errorMessageLabel)
        errorMessageLabel.fillSuperview()
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        
        setupNavigationBarItems()
        Service.sharedInstance.fetchHomeFeed { (homeDataSource, err) in
            if let err = err{
                self.errorMessageLabel.isHidden = false
                if let apiError = err as? APIError<Service.JSONError>{
                    
                    if apiError.response?.statusCode != 200 {
                        self.errorMessageLabel.text = "Status code was not 200"
                    }
                }
            }
            self.datasource = homeDataSource
        }
    }
    
        
    func setupNavigationBarItems() {
        setupRightNavItems()
        setupLeftNavItem()
        setupRemainingNavItem()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    fileprivate func getEstimatedHeightForText(_ string: String) -> CGFloat {
    
        //            Getting estimation of cell's height using user.biotext as biotext has the effect on height
        let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12
        // Size is the maximum space you would give to the text
        let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
        let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
        // This provides us with the rectangle frame required to show the biotext textview
        let estimatedFrame = NSString(string: string).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        return estimatedFrame.height
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0{
            guard let user = self.datasource?.item(indexPath) as? User else { return .zero}
            return CGSize(width: view.frame.width, height: getEstimatedHeightForText(user.bioText) + 66)
        }
        else if indexPath.section == 1{
            guard let tweet = self.datasource?.item(indexPath) as? Tweet else { return .zero }
                return CGSize(width: view.frame.width, height: getEstimatedHeightForText(tweet.message) + 77)
        }
        
        return CGSize(width: view.frame.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        
        return CGSize(width: view.frame.width, height: 64)
    }


}
