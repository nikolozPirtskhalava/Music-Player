//
//  Songs+List.swift
//  Music Player
//
//  Created by nikoloz on 13.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation
import SwifterSwift
import UIKit

extension SongsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configureTableOnLoad() {
        let nibName = SwifterSwift.typeName(for: SongTableViewCell.self)
        let cellIdentifier = nibName
        self.songsTableView.register(UINib.init(nibName: nibName, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = SwifterSwift.typeName(for: SongTableViewCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! SongTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
