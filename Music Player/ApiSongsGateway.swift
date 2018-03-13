//
//  ApiSongsGateway.swift
//  Music Player
//
//  Created by nikoloz on 13.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation


protocol ApiSongsGateway: SongsGateway {
    
}

class ApiSongsGatewayImplementation: ApiSongsGateway {
    let apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func searchSongs(with keyword: String, completionHandler: @escaping (Result<[Song]>) -> Void) {
        
    }
    
}
