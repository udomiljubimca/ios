//
//  NetworkError.swift
//  UdomiLjubimca
//
//  Created by Dejan Zuza on 13. 5. 2021..
//

import Foundation

enum NetworkError: Error {
    case generic(Error)
    case message(String?)
    case serverFailed
    case jsonDecode(Error)
    case badRequest
    case authorizationFailed

    private var genericErrorMessage: String {
        return "Ups! Something went wrong!"
    }
}

extension NetworkError: LocalizedError {
    //NOTE: Update this when strings are defined
    //NOTE: LOCALIZE
    var localizedDescription: String {
        switch self {
        case let .generic(error):
            return error.localizedDescription
        case let .message(message):
            return message ?? genericErrorMessage
        case let .jsonDecode(error):
            return error.localizedDescription
        default:
            return genericErrorMessage
        }
    }
}
