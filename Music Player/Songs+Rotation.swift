//
//  Songs+Rotation.swift
//  Music Player
//
//  Created by nikoloz on 13.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation
import SwifterSwift
import UIKit

extension SongsViewController {
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if (UIDevice.current.orientation.isLandscape) {
            searchBarLeadingConstraint.constant = SwifterSwift.screenHeight/2
            tableViewTrailingConstraint.constant = SwifterSwift.screenHeight/2
            tableViewTopConstraint.constant = 0
            mediaPlayerControlsLeadingConstraint.constant = SwifterSwift.screenHeight/2
            mediaPlayerHeightConstraint.constant = SwifterSwift.screenWidth - searchBar.frame.size.height - CGFloat(Default.StatusBarHeight)
        } else {
            searchBarLeadingConstraint.constant = 0
            tableViewTrailingConstraint.constant = 0
            tableViewTopConstraint.constant = searchBar.frame.height + CGFloat(Default.StatusBarHeight)
            mediaPlayerControlsLeadingConstraint.constant = 0
            mediaPlayerHeightConstraint.constant = CGFloat(Default.MediaPlayerHeightConstraint)
        }
    }
    
}
