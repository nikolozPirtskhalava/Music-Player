//
//  SongsApiRequest.swift
//  Music Player
//
//  Created by nikoloz on 13.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation

struct ArtistSearchParams {
    var artistName: String
    var limit: Int
}

class SongsApiReqeust: ApiRequest {
    let searchParams: ArtistSearchParams

    init(searchParams: ArtistSearchParams) {
        self.searchParams = searchParams
    }
    
    var urlRequest: URLRequest {
        let termValue = searchParams.artistName
        let limitKey = APPURL.Param.Limit
        let limitValue = searchParams.limit
        let url: URL!  = URL.init(string: APPURL.Search + termValue + limitKey + "\(limitValue)")
        var request = URLRequest(url: url)
            request.httpMethod = "GET"
        return request
    }
}
