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

protocol SongsViewPresenter {
    
}

class SongsViewPresenterImplementation: SongsViewPresenter {
    
    fileprivate weak var view: SongsView?
    fileprivate let displaySongsUseCase: DisplaySongsUseCase?
    
    init(view: SongsView?, displaySongsUseCase: DisplaySongsUseCase?) {
        self.view = view
        self.displaySongsUseCase = displaySongsUseCase
    }

    
}
