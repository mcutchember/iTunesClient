//
//  VC_Network.swift
//  iTunesClient
//
//  Created by Myle$ on 5/13/19.
//  Copyright © 2019 Myle$. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
    func getSearchTextMedia( media: String, term: String) {
        
        // networking, grabbing media content
        iTunesAPIClient.getMediaForTermAndMediaString(media, term) { (success, resultMedia, error) in
            DispatchQueue.main.async {
                if success {
                    if let resultMedia = resultMedia {
                        if resultMedia.count == 0 {
                            self.displayAlertView(title: "No results were found", message: "Please try searching for something else")
                        }
                        
                        self.filteredMediaArray = resultMedia
                        self.stopActivityIndicator()
                        self.mediaTableView.reloadData()
                    }
                } else {
                    self.displayAlertView(title: "Error Request", message: error)
                    
                }
            }
        }
    }
}
