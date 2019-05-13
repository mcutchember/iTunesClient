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
    
    // IBOutlets
    
    @IBOutlet var mediaTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setNavigation()
        configureSearchAndScopeBar()
        activityIndicator.isHidden = true
    
    }
    
    func setNavigation() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Music"
    }
    
    func configureSearchAndScopeBar() {
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        searchController.searchBar.delegate = self
        let categories = ["Music", "TV Show", "Movie"]
        searchController.searchBar.scopeButtonTitles = categories
    }
    
    func startActivityIndicator() {
        activityIndicator.isHidden = false
        activityIndicator.alpha = 0.5
        activityIndicator.startAnimating()
        self.view.alpha = 0.7
    }
    
    func stopActivityIndicator() {
        activityIndicator.isHidden = true
        self.activityIndicator.stopAnimating()
        self.view.alpha = 1.0
    }
    
    // Alert View
    
    func displayAlertView(title: String?, message: String?){
        
        if message != nil{
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .default) {action in}
            alertController.addAction(OKAction)
            self.present(alertController, animated: true) {}
        }
    }
    
    func showTrailor(){
        guard let videoString = selectedMedia?.movieTrailer else {return}
        guard let videoURL = URL(string: videoString) else {return}
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        self.present(playerViewController, animated: true) {
            playerViewController.player?.play()
        }
    }


    func playSong(){
        guard let songString = selectedMedia?.songPlay else {return}
        guard let songURL = URL(string: songString) else {return}
        let player = AVPlayer(url: songURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player?.play()
        }
    }
    
}

