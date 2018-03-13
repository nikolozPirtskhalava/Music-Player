//
//  ViewController.swift
//  Music Player
//
//  Created by nikoloz on 12.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import UIKit
import SwifterSwift

class SongsViewController: UIViewController, SongsView {
    
    @IBOutlet weak var songsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var presenter: SongsPresenter?
    var configurator = SongsConfiguratorImplementation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureTableOnLoad()
        self.configurator.configure(for: self)
        self.presenter?.presentInitialSongs()
    }

    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        
    }
    
    func refreshTableView() {
        self.songsTableView.reloadData()
    }
    
    func displayeRemoteSongsFetchError(title: String, message: String) {
        
    }
    
}
