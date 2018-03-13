//
//  PlayerViewPresenter.swift
//  Music Player
//
//  Created by nikoloz on 13.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation

protocol MusicPlayerView: class {
    func refreshTableView()
    func displayeRemoteSongsFetchError(title: String, message: String)
}

protocol MusicPlayerViewPresenter {
    
}

class MusicPlayerViewPresenterImplementation: MusicPlayerViewPresenter {
    
    fileprivate weak var view: MusicPlayerView?

    
}
