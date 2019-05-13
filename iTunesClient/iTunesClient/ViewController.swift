//
//  ViewController.swift
//  iTunesClient
//
//  Created by Myle$ on 5/12/19.
//  Copyright © 2019 Myle$. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {
    
    // Properties
    
    // Categories
    let category = ["Music" : "Music", "TV Show" : "TV Show", "Movie": "Movie"]
    
    // Search
    
    let searchController = UISearchController(searchResultsController: nil)
    var searchTextFinal = String()
    
    // Media
    var media: iTunesMedia?
    var filteredMediaArray = [iTunesMedia]()
    var selectedMedia: iTunesMedia?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

