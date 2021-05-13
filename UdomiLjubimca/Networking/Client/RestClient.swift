//
//  RestClient.swift
//  UdomiLjubimca
//
//  Created by Dejan Zuza on 13. 5. 2021..
//

import Alamofire
import Foundation

class RestClient {
    private let manager: Alamofire.Session

    init() {
        manager = Alamofire.Session(configuration: URLSessionConfiguration.default)
    }
}

// MARK: - Public Methods
extension RestClient: RestClientProtocol {
    func GET<T: Decodable>(decode: T.Type,
                           decoder: JSONDecoder,
                           endpoint: EndpointProtocol,
                           headers: RestClientProtocol.Headers,
                           queryParams: [URLQueryItem]?,
                           body: RestClientProtocol.Body?,
                           result: ((Swift.Result<T, NetworkError>) -> Void)?) {
        request(endpoint: endpoint,
                method: .get,
                headers: headers,
                queryParams: queryParams,
                body: body) { [weak self] in
            self?.handleDecodableResponse(decode: T.self,
                                         decoder: decoder,
                                         result: $0,
                                         completion: result)
        }
    }
}

// MARK: - Private Methods
private extension RestClient {
    func request(endpoint: EndpointProtocol,
                 method: HTTPMethod,
                 headers: RestClientProtocol.Headers,
                 queryParams: [URLQueryItem]?,
                 body: RestClientProtocol.Body?,
                 result: RestClientProtocol.DataResult) {
        //NOTE: Handle queryParams

        let request = manager.request(endpoint.url,
                                      method: method,
                                      parameters: body,
                                      encoding: JSONEncoding.default,
                                      headers: headers)
        request
            .validate(statusCode: 200..<300)
            .responseData { response in
                switch response.result {
                case let .success(data):
                    let dataResponse = DataResponse(statusCode: response.response?.statusCode ?? 0, data: data)
                    result?(.success(dataResponse))
                case let .failure(error):
                    //NOTE: Handle status codes
                    result?(.failure(NetworkError.generic(error)))
                }
            }
    }

    func handleDecodableResponse<T: Decodable>(decode: T.Type,
                                               decoder: JSONDecoder,
                                               result: Swift.Result<DataResponse, NetworkError>,
                                               completion: ((Swift.Result<T, NetworkError>) -> Void)?) {
        switch result {
        case let .success(response):
            DispatchQueue.global(qos: .userInitiated).async {
                do {
                let decodedObject = try decoder.decode(T.self, from: response.data)
                    DispatchQueue.main.async { completion?(.success(decodedObject)) }
                } catch {
                    DispatchQueue.main.async { completion?(.failure(.jsonDecode(error)))}
                }
            }
        case let .failure(error):
            DispatchQueue.main.async { completion?(.failure(error)) }
        }
    }
}
