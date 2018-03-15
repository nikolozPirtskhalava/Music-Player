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
        audioPlayer = AVPlayer.init(url: contentUrl)
        audioPlayer!.play()
    }
    
    func stopMediaPlayback() {
        guard let player = audioPlayer else {
            return
        }
        
        player.pause()
    }
    
    func showMediaPlayer() {
        mediaPlayerView.isHidden = false
    }
    
    func resumeMediaPlayback() {
        guard let player = audioPlayer else {
            return
        }
        
        player.play()
    }
    
    func DisplayButtonState(isSelected: Bool) {
        buttonPlayPause.isSelected = isSelected
    }
    
}
