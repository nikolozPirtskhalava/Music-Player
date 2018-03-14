//
//  Songs+MediaPlayer.swift
//  Music Player
//
//  Created by nikoloz on 14.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation
import AVFoundation

extension SongsViewController {
    
    func playAudioTrack(with contentUrl: URL) {
        self.audioPlayer = AVPlayer.init(url: contentUrl)
        self.audioPlayer.play()
    }
    
    func stopMediaPlayback() {
        
    }
    
    func showMediaPlayer() {
        self.mediaPlayerView.isHidden = false
    }
    
}
