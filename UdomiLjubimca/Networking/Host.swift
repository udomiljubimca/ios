//
//  Host.swift
//  UdomiLjubimca
//
//  Created by Dejan Zuza on 13. 5. 2021..
//

import Foundation

enum Host {
    case production
}

extension Host {
    var baseURL: String {
        switch self {
        case .production:
            //NOTE: add base url
            return "base url"
        }
    }

    static var current: Host {
        return .production
    }
}
