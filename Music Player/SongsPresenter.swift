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
    func display(indicated: Bool)
}

protocol SongsView: class {
    func refreshTableView()
    func displayeRemoteSongsFetchError(error: Error)
    func playAudioTrack(with contentUrl: URL)
    func displayArtImageView(with artImageStringUrl: String)
    func DisplayButtonState(isSelected: Bool)
    func showTableView()
    func stopMediaPlayback()
    func resumeMediaPlayback()
    func showMediaPlayer()
    func stopLoading()
}

protocol SongsPresenter {
    var  numberOfSOngs:Int { get }
    func configure(cell: SongTableViewCell, forRow row: Int)
    func presentSongs(with artisName: String)
    func presentInitialSongs()
    func didSelect(row: Int)
    func playPauseButtonTapped(_ selected: Bool)
}

class SongsPresenterImplementation: SongsPresenter {
    
    fileprivate weak var view: SongsView?
    fileprivate let displaySongsUseCase: DisplaySongsUseCase?
    
    var songs = [Song]()
    var playingSong: Song?
    var selectedSong:Song? {
        didSet {
            view?.showMediaPlayer()
        }
    }
    
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
        
        cell.display(art: song.artImageUrl)
        cell.display(song: song.trackName)
        cell.display(album: song.albumTitle)
        cell.display(artist: song.artistName)
        cell.display(indicated: song == playingSong)
    }
    
    func searchForSongs(with params: ArtistSearchParams = ArtistSearchParams(artistName: Default.Artist, limit: Default.Limit)) {
        displaySongsUseCase?.displaySongs(with: params, completionHandler: { (result) in
            self.view?.stopLoading()
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
        self.view?.showTableView()
        self.view?.refreshTableView()
    }
    
    func handleSongsFetchError(_ error: Error) {
        self.view?.displayeRemoteSongsFetchError(error: error)
    }
    
    func didSelect(row: Int) {
        guard let song = self.songs.item(at: row) else {
            return
        }
        
        selectedSong = song
        view?.displayArtImageView(with: song.artImageUrl)
        view?.DisplayButtonState(isSelected: selectedSong == playingSong)
    }
    
    func playPauseButtonTapped(_ playButtonTapped: Bool) {
        guard let song = selectedSong,
              let songPreviewUrl = URL.init(string: song.previewUrl) else {
            return
        }
        
        playButtonTapped ? startMediaplayBack(with: songPreviewUrl) : stopMediaPlayBack()
    }
    
    private func startMediaplayBack(with contentUrl: URL) {
        if noMediaPlayback() {
            selectPlayingSong()
            view?.playAudioTrack(with: contentUrl)
        } else {
            if selectedSongIsPlaying() {
                view?.resumeMediaPlayback()
            } else {
                selectPlayingSong()
                view?.playAudioTrack(with: contentUrl)
            }
        }
    }
    
    private func stopMediaPlayBack() {
        view?.stopMediaPlayback()
    }
    
    private func noMediaPlayback() -> Bool {
        return self.playingSong == nil
    }
    
    private func selectedSongIsPlaying() -> Bool {
        return selectedSong == playingSong
    }
    
    private func selectPlayingSong() {
        playingSong = selectedSong
        view?.refreshTableView()
    }
    
}
