//
//  VC_Search.swift
//  iTunesClient
//
//  Created by Myle$ on 5/13/19.
//  Copyright © 2019 Myle$. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {}
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
        // MARK: update navigation title item
        switch selectedScope {
            
        case 0:
            self.navigationItem.title = "Music"
            
        case 1:
            self.navigationItem.title = "TV Show"
            
        case 2:
            self.navigationItem.title = "Movie"
            
        default:
            print("")
        }
    }
    
    
    func searchBar( _ searchBar: UISearchBar, textDidChange searchText: String){
        debugPrint("Warning: \(searchText)")
        
        switch navigationItem.title {
        case category["Music"]:
            debugPrint("The scope is in: music")
            searchTextFinal = searchText
        case category["TV Show"]:
            debugPrint("The scope is in: tv show")
            searchTextFinal = searchText
        case category["Movie"]:
            debugPrint("The scope is in: movies")
            searchTextFinal = searchText
        default:
            print("")
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        startActivityIndicator()
        
        var actualMedia = String()
        
        switch searchBar.selectedScopeButtonIndex {
        case 0:
            actualMedia = "music"
        case 1:
            actualMedia = "tvShow"
        case 2:
            actualMedia = "movie"
        default:
            actualMedia = ""
        }
        
        getSearchTextMedia(media: actualMedia, term: searchTextFinal)
    }
}
