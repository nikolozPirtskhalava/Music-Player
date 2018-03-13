//
//  DisplaySongsList.swift
//  Music Player
//
//  Created by nikoloz on 13.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation

typealias DisplaySongsUseCaseCompletionHandler = (_ songs: Result<[Song]>) -> Void

protocol DisplaySongsUseCase {
    func displaySongs(with params: ArtistSearchParams, completionHandler: @escaping DisplaySongsUseCaseCompletionHandler)
}

class DisplaySongsUseCaseImplementation: DisplaySongsUseCase {
    let songsGateway: SongsGateway
    
    init(songsGateway: SongsGateway) {
        self.songsGateway = songsGateway
    }
    
    func displaySongs(with params: ArtistSearchParams, completionHandler: @escaping (Result<[Song]>) -> Void) {
        self.songsGateway.searchSongs(with: params) { (result) in
            completionHandler(result)
        }
    }
    
}
