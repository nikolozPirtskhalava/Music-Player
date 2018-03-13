//
//  ViewController.swift
//  Music Player
//
//  Created by nikoloz on 12.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import UIKit
import SwifterSwift

class MusicPlayerViewController: UIViewController, MusicPlayerView {
    
    @IBOutlet weak var songsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        
    }
    
    func refreshTableView() {
        
    }
    
    func displayeRemoteSongsFetchError(title: String, message: String) {
        
    }
    
}
