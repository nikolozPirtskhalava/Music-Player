//
//  ViewController.swift
//  Music Player
//
//  Created by nikoloz on 12.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import UIKit
import Kingfisher
import AVFoundation
import SwifterSwift

class SongsViewController: UIViewController, SongsView {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var mediaPlayerView: UIView!
    @IBOutlet weak var songsTableView: UITableView! {
        didSet {
            songsTableView.contentInset = UIEdgeInsetsMake(0, 0, 100, 0)
        }
    }
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchBarLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var mediaPlayerControlsLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var mediaPlayerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var artImageView: UIImageView!
    @IBOutlet weak var buttonPlayPause: UIButton!
    
    var presenter: SongsPresenter?
    var configurator = SongsConfiguratorImplementation()
    var audioPlayer: AVPlayer?
    
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
    
    func showTableView() {
        self.songsTableView.isHidden = false
    }
    
    func displayeRemoteSongsFetchError(error: Error) {
        UIAlertController.init(error: error).show()
    }
    
    func displayArtImageView(with artImageStringUrl: String) {
        guard let artImageUrl = URL.init(string: artImageStringUrl) else {
            return
        }
        
        artImageView.kf.setImage(with: artImageUrl)
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func didTapPlayPauseButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        presenter?.playPauseButtonTapped(sender.isSelected)
    }
    
    func stopLoading() {
        self.activityIndicator.stopAnimating()
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
}
