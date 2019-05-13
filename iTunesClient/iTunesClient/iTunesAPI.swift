//
//  iTunesAPI.swift
//  iTunesClient
//
//  Created by Myle$ on 5/12/19.
//  Copyright © 2019 Myle$. All rights reserved.
//

import Foundation
import Alamofire

class iTunesAPIClient: NSObject {
    
    override init() {
        super.init()
    }
    
    var session = URLSession.shared
    
    // Networking Methods
    
    static func getMediaForTermAndMediaString(_ media: String, _ term: String?, completionHandlerFor_TermAndMediaString: @escaping (_ success: Bool, _ result: [iTunesMedia]?, _ error: String?) -> Void)  {
        
        Alamofire.request(configureUrlSearchText(media: media, term: term)).responseJSON { response in
            
            
            // response status code
            if let status = response.response?.statusCode {
                switch(status){
                case 200:
                    print("example success")
                default:
                    let errorMessage = "error with response status: \(status)"
                    completionHandlerFor_TermAndMediaString(false, nil, errorMessage)
                }
            }
            
            
            if let jsonObjectResult: Any = response.result.value {
                
                let jsonObjectResultDictionary = jsonObjectResult as! [String:AnyObject]
                
                debugPrint("🤜JSON TEXT SEARCH MEDIA: \(jsonObjectResult)")
                
                if let results = jsonObjectResultDictionary["results"] {
                    
                    let resultsMediaTextSearch = iTunesMedia.mediaFromResults(results as! [[String : AnyObject]])
                    
                    //test
                    debugPrint("🤾🏼‍♂️ TMDBMovie...\(resultsMediaTextSearch)")
                    
                    completionHandlerFor_TermAndMediaString(true, resultsMediaTextSearch, nil)
                    
                }
            }
        }
    }
    
    
    static func getArtworkImage( artworkUrl: String, completionHandlerForArtwork: @escaping ( _ imageData: Data?, _ error: String?) -> Void) {
        
        Alamofire.request(artworkUrl).responseData { response in
            
            //response status code
            
            if let status = response.response?.statusCode{
                switch(status){
                case 200:
                    print("we good")
                default:
                    _ = "error with response status: \(status)"
                }
            }
            
            if let dataObjectResult: Any = response.result.value {
                
                let dataObjectResult = dataObjectResult as! Data
                
                completionHandlerForArtwork(dataObjectResult, nil)
                
                debugPrint("Test: \(dataObjectResult)")
            }
        }
        
    }
    
    // configure the different URLs to send in the APi calls
    
    static func configureUrlSearchText( media: String, term: String?) -> URL {
        
        var components = URLComponents()
        components.scheme = iTunesAPIClient.Constants.ApiScheme
        components.host = iTunesAPIClient.Constants.ApiHost
        components.path = iTunesAPIClient.Constants.ApiPath
        components.queryItems = [URLQueryItem]()

        let queryItem1 = URLQueryItem(name: iTunesAPIClient.ParameterKeys.Media, value: media)
        
        let queryItem2 = URLQueryItem(name: iTunesAPIClient.ParameterKeys.StringSearch, value: term)
        components.queryItems?.append(queryItem1)
        components.queryItems?.append(queryItem2)
        
        return components.url!
    }
    
}
