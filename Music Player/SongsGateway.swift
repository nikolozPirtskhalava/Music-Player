//
//  SongsGateway.swift
//  Music Player
//
//  Created by nikoloz on 13.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation

typealias SearchSongsGatewayCompletionHandler = (_ songs: Result<[Song]>) -> Void

protocol SongsGateway {
    func searchSongs(with params: ArtistSearchParams, completionHandler: @escaping SearchSongsGatewayCompletionHandler)
}
