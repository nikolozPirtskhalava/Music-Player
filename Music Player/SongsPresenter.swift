//
//  PlayerViewPresenter.swift
//  Music Player
//
//  Created by nikoloz on 13.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation

protocol SongCellView {
    func display(artist: String)
    func display(album: String)
    func display(song: String)
    func display(art: String)
}

protocol SongsView: class {
    func refreshTableView()
    func displayeRemoteSongsFetchError(title: String, message: String)
}

protocol SongsPresenter {
    var  numberOfSOngs:Int { get }
    func configure(cell: SongTableViewCell, forRow row: Int)
    func presentSongs(with artisName: String)
    func presentInitialSongs()
    
}

class SongsPresenterImplementation: SongsPresenter {
    
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
    
    func configure(cell: SongTableViewCell, forRow row: Int) {
        guard let song = self.songs.item(at: row) else {
            return
        }
        
        cell.display(art: song.artImageUrl!)
        cell.display(song: song.trackName!)
        cell.display(album: song.albumTitle!)
        cell.display(artist: song.artistName!)
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
