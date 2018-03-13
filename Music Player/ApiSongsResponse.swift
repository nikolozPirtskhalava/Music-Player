//
//  ApiSongsResponse.swift
//  Music Player
//
//  Created by nikoloz on 13.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation


struct ApiSongsResponse: InitializableWithData, InitializableWithJson {
    var count: NSNumber
    var songs: [ApiSong]
    
    
    init(data: Data?) throws {
        guard let data = data,
            let jsonObject = try? JSONSerialization.jsonObject(with: data),
            let json = jsonObject as? [String: Any] else {
                throw NSError.createPraseError()
        }
        
        try self.init(json: json)
    }
    
    init(json: [String : Any]) throws {
        guard let count = json["resultCount"] as? NSNumber,
            let songs = json["results"] as? [[String: Any]] else {
                throw NSError.createPraseError()
        }
        
        self.count = count
        do {
            self.songs = try songs.map { try ApiSong.init(json: $0) }
        } catch {
            throw NSError.createPraseError()
        }
    }
    
}
