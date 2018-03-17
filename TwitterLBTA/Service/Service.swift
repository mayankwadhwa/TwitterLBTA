//
//  Service.swift
//  TwitterLBTA
//
//  Created by Mayank  Wadhwa on 01/03/18.
//  Copyright © 2018 ShinobiTech. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }

    // Creating a singleton which makes it possible to have only one instance of this object
    static let sharedInstance = Service()
    
    func fetchHomeFeed(completion: @escaping (HomeDataSource?, Error?) -> ()) {
        print("fetching home feed")
        let request: APIRequest<HomeDataSource, JSONError> = tron.swiftyJSON.request("/twitter/home")
        request.perform(withSuccess: { homedatasource in
            completion(homedatasource, nil)
            print("JSON parsing succesful")
        }) { (err) in
            completion(nil, err)
        }
        //        This is lot of code we are gonna use TRON instead of this
        //        URLSession.shared.dataTask(with: <#T##URL#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
        
    }

}
