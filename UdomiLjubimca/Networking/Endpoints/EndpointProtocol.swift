//
//  EndpointProtocol.swift
//  UdomiLjubimca
//
//  Created by Dejan Zuza on 13. 5. 2021..
//

import Foundation

protocol EndpointProtocol {
    typealias Path = String
    var path: Path { get }
    var url: String { get }
    var apiVersion: APIVersion { get }
}

extension EndpointProtocol where Self: RawRepresentable, Self.RawValue == String {
    var path: Path {
        return rawValue
    }
}

extension EndpointProtocol {
    var url: String {
        return "\(Host.current.baseURL)\(path)"
    }

    var apiVersion: APIVersion {
        return .v1
    }
}
