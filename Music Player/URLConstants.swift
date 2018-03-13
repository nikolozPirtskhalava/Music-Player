//
//  UrlConstants.swift
//  Music Player
//
//  Created by nikoloz on 13.03.18.
//  Copyright © 2018 Mobility LLC. All rights reserved.
//

import Foundation

struct APPURL {
    
    private struct Domain {
        static let Dev = "https://itunes.apple.com"
        static let Pro = "https://itunes.apple.com"
    }
    
    private struct Method {
        static let Search = "/search?"
    }
    
    private static let BaseUrl = Domain.Dev
    
    static var Search: String {
        return BaseUrl  + Method.Search
    }
}
