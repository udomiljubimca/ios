//
//  RestClientProtocol.swift
//  UdomiLjubimca
//
//  Created by Dejan Zuza on 13. 5. 2021..
//

import Foundation
import Alamofire

protocol RestClientProtocol {
    typealias Headers = HTTPHeaders
    typealias Body = [String: Any]
    typealias DataResult = ((Swift.Result<DataResponse, NetworkError>) -> Void)?

    func GET<T: Decodable>(decode: T.Type,
                           decoder: JSONDecoder,
                           endpoint: EndpointProtocol,
                           headers: RestClientProtocol.Headers,
                           queryParams: [URLQueryItem]?,
                           body: RestClientProtocol.Body?,
                           result: ((Swift.Result<T, NetworkError>) -> Void)?)
}
