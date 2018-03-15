//
//  Song.swift
//  Music Player
//
//  Created by nikoloz on 13.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation


class Song {
    var id: String
    var trackName: String
    var artistName: String
    var albumTitle: String
    var artImageUrl: String
    var previewUrl: String
    
    init(id: String,trackName: String, artistName: String, albumTitle: String, artImageUrl: String, previewUrl: String) {
        self.id = id
        self.trackName = trackName
        self.artistName = artistName
        self.albumTitle = albumTitle
        self.artImageUrl = artImageUrl
        self.previewUrl = previewUrl
    }
}

extension Song: Equatable{}

func == (lhs: Song, rhs: Song) -> Bool {
    return lhs.id == rhs.id
}

