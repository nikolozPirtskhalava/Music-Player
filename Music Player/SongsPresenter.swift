//
//  PlayerViewPresenter.swift
//  Music Player
//
//  Created by nikoloz on 13.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation

protocol SongsView: class {
    func refreshTableView()
    func displayeRemoteSongsFetchError(title: String, message: String)
}

protocol SongsPresenter {
    var  numberOfSOngs:Int { get }
    func presentSongs(with artisName: String)
    func presentInitialSongs()
    
}

class SongsPresenterImplementation: SongsViewPresenter {
    
    fileprivate weak var view: SongsView?
    fileprivate let displaySongsUseCase: DisplaySongsUseCase?
    
    var songs = [Song]()
    
    init(view: SongsView?, displaySongsUseCase: DisplaySongsUseCase?) {
        self.view = view
        self.displaySongsUseCase = displaySongsUseCase
    }
    
    var numberOfSOngs: Int {
        return self.songs.count
    }
    
    func presentSongs(with artisName: String) {
        let searchParams = ArtistSearchParams(artistName: artisName, limit: Default.Limit)
        searchForSongs(with: searchParams)
    }
    
    func presentInitialSongs() {
        searchForSongs()
    }
    
    
    func searchForSongs(with params: ArtistSearchParams = ArtistSearchParams(artistName: Default.Artist, limit: Default.Limit)) {
        displaySongsUseCase?.displaySongs(with: params, completionHandler: { (result) in
            switch result {
            case let .success(songs):
                self.handleSongsReceived(songs)
            case let .failure(error):
                self.handleSongsFetchError(error)
            }
        })
    }
    
    func handleSongsReceived(_ songs:[Song]) {
        self.songs = songs
        self.view?.refreshTableView()
    }
    
    func handleSongsFetchError(_ error: Error) {
        self.view?.displayeRemoteSongsFetchError(title: "Error", message: error.localizedDescription)
    }
    
}
