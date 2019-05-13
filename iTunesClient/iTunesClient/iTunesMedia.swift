//
//  iTunesMedia.swift
//  iTunesClient
//
//  Created by Myle$ on 5/12/19.
//  Copyright © 2019 Myle$. All rights reserved.
//

import Foundation

struct iTunesMedia {

    let tvShowTitle: String? // 'artistName'
    let tvShowEpisodeName: String? // 'trackName'
    let tvShowArtwork: String? // 'artworkUrl100'
    let tvShowEpisodeDescription: String? // 'longDescription'
    let tvShowEpisodeTrailer: String? // 'previewUrl'
    // movie
    let movieTitle: String? // 'trackName'
    let movieDescription: String? // 'longDescription'
    let movieArtwork: String? // 'artworkUrl100'
    let movieTrailer: String? // 'previewUrl'
    // music
    let songTitle: String? // 'trackName'
    let songArtistName: String? // 'artistName'
    let songArtwork: String? // 'artworkUrl100'
    let songPlay: String? // 'previewUrl'
    
    
    // Initializers
    
    init(dictionary: [String:AnyObject]) {
        // tv show
        tvShowTitle = dictionary[iTunesAPIClient.JSONResponseKeys.ArtistName] as? String
        tvShowEpisodeName = dictionary[iTunesAPIClient.JSONResponseKeys.TrackName] as? String
        tvShowArtwork = dictionary[iTunesAPIClient.JSONResponseKeys.ArtworkUrl] as? String
        tvShowEpisodeDescription = dictionary[iTunesAPIClient.JSONResponseKeys.LongDescription] as? String
        tvShowEpisodeTrailer = dictionary[iTunesAPIClient.JSONResponseKeys.PreviewUrl] as? String
        
        // movie
        movieTitle = dictionary[iTunesAPIClient.JSONResponseKeys.TrackName] as? String
        movieDescription = dictionary[iTunesAPIClient.JSONResponseKeys.LongDescription] as? String
        movieArtwork = dictionary[iTunesAPIClient.JSONResponseKeys.ArtworkUrl] as? String
        movieTrailer = dictionary[iTunesAPIClient.JSONResponseKeys.PreviewUrl] as? String
        
        // music
        songTitle = dictionary[iTunesAPIClient.JSONResponseKeys.TrackName] as? String
        songArtistName = dictionary[iTunesAPIClient.JSONResponseKeys.ArtistName] as? String
        songArtwork = dictionary[iTunesAPIClient.JSONResponseKeys.ArtworkUrl] as? String
        songPlay = dictionary[iTunesAPIClient.JSONResponseKeys.PreviewUrl] as? String
    }
    
    // Methods
    
    static func mediaFromResults(_ mediaResults: [[String:AnyObject]]) -> [iTunesMedia] {
        
        var mediaArray = [iTunesMedia]()
        
        for result in mediaResults {
            mediaArray.append(iTunesMedia(dictionary: result))
        }
        
        return mediaArray
    }
    
    
}
