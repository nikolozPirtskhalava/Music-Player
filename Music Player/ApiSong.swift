//
//  ApiSong.swift
//  Music Player
//
//  Created by nikoloz on 13.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation


struct ApiSong : InitializableWithJson {
    var id: String
    var trackName: String
    var artistName: String
    var albumTitle: String
    var artImageUrl: String
    var previewUrl: String
    
    init(json: [String : Any]) throws {
        /* guard let artistName = json["artistName"] as? String,
              let trackName = json["trackName"] ,
              let albumTitle = json["collectionName"] as? String,
              let artImageUrl = json["artworkUrl100"] as? String,
              let previewUrl = json["previewUrl"] as? String  else {
                throw NSError.createPraseError()
        }*/
        
        self.id = NSUUID().uuidString
        self.trackName = json["artistName"] as? String ?? ""
        self.artistName = json["artistName"] as? String ?? ""
        self.albumTitle = json["collectionName"] as? String ?? ""
        self.artImageUrl = json["artworkUrl100"] as? String ?? ""
        self.previewUrl =  json["previewUrl"] as? String ?? ""
    }
}

extension ApiSong {
    var song: Song {
        return Song(id: id,
                    trackName: trackName,
                    artistName: artistName,
                    albumTitle: albumTitle,
                    artImageUrl: artImageUrl,
                    previewUrl: previewUrl)
    }
}
