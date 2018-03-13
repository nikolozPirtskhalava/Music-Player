//
//  PlayerViewConfigurator.swift
//  Music Player
//
//  Created by nikoloz on 13.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation


protocol SongsConfigurator {
    func configure(for playerViewController: SongsViewController)
}

class SongsConfiguratorImplementation: SongsConfigurator {
    func configure(for songsViewController: SongsViewController) {
        let apiClient = ApiClientImplementation.init(urlSessionConfiguration: URLSessionConfiguration.default, completionHandlerQueue: OperationQueue.main)
        let apiSongsGateway = ApiSongsGatewayImplementation.init(apiClient: apiClient)
        let displaySongsUseCase = DisplaySongsUseCaseImplementation.init(songsGateway: apiSongsGateway)
        let presenter = SongsPresenterImplementation.init(view: songsViewController, displaySongsUseCase: displaySongsUseCase)
        songsViewController.presenter = presenter
    }
}
