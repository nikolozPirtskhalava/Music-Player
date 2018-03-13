//
//  Songs+Search.swift
//  Music Player
//
//  Created by nikoloz on 13.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation
import UIKit

extension SongsViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        searchSongs(for: searchBar.text)
    }
    
    func searchSongs(for artistName: String?){
        guard let name = artistName else {
            return
        }
        presenter?.presentSongs(with: name)
    }
    
}
