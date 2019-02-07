//
//  NetworkServiceMock.swift
//  PhotoViewerTests
//
//  Created by Ohanna Perre on 07/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import Foundation
@testable import PhotoViewer

struct NetworkServiceMock: NetworkServiceProtocol {
    var result: Any?
    var error: Error?
    
    func request<T>(with: RequestData,
                    responseType: T.Type,
                    handler: @escaping (Result<T>) -> Void) where T: Decodable {
        if let result = self.result {
            handler(.success(result as? T))
        }
        
        if let error = error {
            handler(.error(error))
        }
    }
}
