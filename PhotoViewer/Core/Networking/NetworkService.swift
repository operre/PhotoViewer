//
//  NetworkService.swift
//  PhotoViewer
//
//  Created by Ohanna Perre on 02/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import Foundation

protocol NetworkServiceProtocol {
    func request<T: Decodable>(with: RequestData, responseType: T.Type, handler: @escaping (Result<T>) -> Void)
}

struct NetworkService: NetworkServiceProtocol {
    private let parser: JSONParserProtocol
    private let session: URLSession
    
    init(parser: JSONParserProtocol, session: URLSession = URLSession.shared) {
        self.parser = parser
        self.session = session
    }
    
    func request<T: Decodable>(with requestData: RequestData,
                               responseType: T.Type,
                               handler: @escaping (Result<T>) -> Void) {
        guard var url = URL(string: requestData.host + requestData.path) else {
            handler(.error(NetworkError.invalidURL))
            return
        }
        
        url.append(queryParameters: requestData.queryParameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = requestData.method.rawValue
        
        self.perform(request: request, handler: handler)
    }
    
    private func perform<T: Decodable>(request: URLRequest, handler: @escaping (Result<T>) -> Void) {
        let dataTask = self.session.dataTask(with: request) { (data, _, error) in
            guard error == nil else {
                handler(.error(error))
                return
            }
            
            guard let data = data else {
                handler(.error(NetworkError.emptyResponse))
                return
            }
            
            guard let result: T = self.parser.parse(from: data) else {
                handler(.error(NetworkError.unableToSerialize))
                return
            }
            
            handler(.success(result))
        }
        
        dataTask.resume()
    }
}
