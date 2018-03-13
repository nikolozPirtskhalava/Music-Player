//
//  SongCell.swift
//  Music Player
//
//  Created by nikoloz on 13.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell, SongCellView {

    @IBOutlet weak var labelArtistName: UILabel!
    @IBOutlet weak var labelSongName: UILabel!
    @IBOutlet weak var labelAlbumName: UILabel!
    @IBOutlet weak var imageViewArt: UIImageView!
    
    func display(art: String) {
        
    }
    
    func display(song: String) {
        self.labelSongName.text = song
    }
    
    func display(album: String) {
        self.labelAlbumName.text = album
    }
    
    func display(artist: String) {
        self.labelArtistName.text = artist
    }

}
