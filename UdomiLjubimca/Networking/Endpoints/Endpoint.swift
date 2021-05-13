//
//  Endpoint.swift
//  UdomiLjubimca
//
//  Created by Dejan Zuza on 13. 5. 2021..
//

import Foundation

enum Endpoint {
    enum Login: String, EndpointProtocol {
        case authorization = "login"
    }
}
