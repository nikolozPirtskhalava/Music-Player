//
//  ApiSong.swift
//  Music Player
//
//  Created by nikoloz on 13.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation


struct ApiSong : InitializableWithJson {
    var trackName: String
    var artistName: String
    var albumTitle: String
    var artImageUrl: String
    var previewUrl: String
    var isPlaying: Bool
    
    init(json: [String : Any]) throws {
        guard let artistName = json["artistName"] as? String,
              let trackName = json["trackName"] as? String,
              let albumTitle = json["collectionName"] as? String,
              let artImageUrl = json["artworkUrl100"] as? String,
              let previewUrl = json["previewUrl"] as? String  else {
                throw NSError.createPraseError()
        }
        
        self.trackName = trackName
        self.artistName = artistName
        self.albumTitle = albumTitle
        self.artImageUrl = artImageUrl
        self.previewUrl = previewUrl
        self.isPlaying = false
    }
}

extension ApiSong {
    var song: Song {
        return Song(trackName: trackName,
                    artistName: artistName,
                    albumTitle: albumTitle,
                    artImageUrl: artImageUrl,
                    previewUrl: previewUrl,
                    isPlaying: isPlaying)
    }
}
