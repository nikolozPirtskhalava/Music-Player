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
    
    func searchSongs(with params: ArtistSearchParams, completionHandler: @escaping (Result<[Song]>) -> Void) {
        let searchRequest = SongsApiReqeust.init(searchParams: params)
        apiClient.execute(request: searchRequest) { (result: Result<ApiResponse<ApiSongsResponse>>) in
            switch result {
            case let .success(response):
                let songs = response.entity.songs.map { $0.song }
                completionHandler(.success(songs))
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
    }
    
}
