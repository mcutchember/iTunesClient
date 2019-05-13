//
//  VC_Table.swift
//  iTunesClient
//
//  Created by Myle$ on 5/13/19.
//  Copyright © 2019 Myle$. All rights reserved.
//

import Foundation
import UIKit


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMediaArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let preImageMusicTV = UIImage(named: "preImageMusicTV")
        let preImageMovie = UIImage(named: "preImageMovie")
        let cellReuseID = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID, for: indexPath) as UITableViewCell
        
        var artwork = String()
        
        switch navigationItem.title {
        case category["Music"]:
            media = filteredMediaArray[(indexPath as NSIndexPath).row]
            cell.textLabel?.text = media?.songTitle
            cell.detailTextLabel?.text = media?.songArtistName
            cell.imageView?.image = preImageMusicTV
            
            if let artworkUrl = media?.songArtwork {
                artwork = artworkUrl
                
                if (media?.songArtwork) != nil {
                    iTunesAPIClient.getArtworkImage(artworkUrl: artworkUrl) { (imageData, error) in
                        if let image = UIImage(data: imageData!) {
                            DispatchQueue.main.async {
                                cell.imageView?.image = image
                            }
                            
                        } else {
                            print(error ?? "empty error")
                        }
                    }
                }
            }
            
        case category["TV Show"]:
            media = filteredMediaArray[(indexPath as NSIndexPath).row]
            cell.textLabel?.text = media?.tvShowTitle
            cell.detailTextLabel?.text = media?.tvShowEpisodeName
            cell.imageView?.image = preImageMusicTV
            
        if let artworkUrl = media?.tvShowArtwork {
            artwork = artworkUrl
            if (media?.tvShowArtwork) != nil {
                iTunesAPIClient.getArtworkImage(artworkUrl: artworkUrl) { (imageData, error) in
                    if let image = UIImage(data: imageData!) {
                        DispatchQueue.main.async {
                            cell.imageView!.image = image
                        }
                    } else {
                        print(error ?? "empty error")
                    }
                }
            }
        }
            
        case category["Movie"]:
            media = filteredMediaArray[(indexPath as NSIndexPath).row]
            cell.textLabel?.text = media?.movieTitle
            cell.detailTextLabel?.text = media?.movieDescription
            cell.imageView?.image = preImageMovie
            
            if let artworkUrl = media?.movieArtwork {
                artwork = artworkUrl
                
                if (media?.movieArtwork) != nil {
                    iTunesAPIClient.getArtworkImage(artworkUrl: artwork) { (imageData, error) in
                        if let image = UIImage(data: imageData!) {
                            DispatchQueue.main.async {
                                cell.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
                                cell.imageView?.image = image
                            }
                        } else {
                            print(error ?? "empty error")
                        }
                    }
                }
            }
            
        default:
            print("")
        }
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch navigationItem.title {
        case category["Music"]:
            selectedMedia = filteredMediaArray[(indexPath as NSIndexPath).row]
            playSong()
        case category["TV Show"]:
            selectedMedia = filteredMediaArray[(indexPath as NSIndexPath).row]
            showTrailor()
        case category["Movie"]:
            selectedMedia = filteredMediaArray[(indexPath as NSIndexPath).row]
            showTrailor()
        default:
            print("")
        }
    }
}
