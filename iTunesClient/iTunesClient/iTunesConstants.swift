//
//  iTunesConstants.swift
//  iTunesClient
//
//  Created by Myle$ on 5/13/19.
//  Copyright © 2019 Myle$. All rights reserved.
//

import Foundation

extension iTunesAPIClient {
    
    // Constants for API
    
    struct Constants {
        static let ApiScheme = "https"
        static let ApiHost = "itunes.apple.com"
        static let ApiPath = "/search"
    }
    
    // Parameter Keys
    
    struct ParameterKeys {
        static let StringSearch = "term"
        static let Media = "media"
    }
    
    // Parameter Values
    
    struct ParameterValues {
        static let Music = "music"
        static let Movie = "movie"
        static let TVShow = "tvShow"
    }
    
    // JSON Response Keys
    
    struct JSONResponseKeys {
        static let TrackName = "trackName"
        static let LongDescription = "longDescription"
        static let ArtworkUrl = "artworkUrl100"
        static let ArtistName = "artistName"
        static let PreviewUrl = "previewUrl"
        
    }
}
