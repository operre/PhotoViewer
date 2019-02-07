//
//  NetworkServiceMock.swift
//  PhotoViewerTests
//
//  Created by Ohanna Perre on 07/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import Foundation
@testable import PhotoViewer

struct NetworkServiceMock<Type: Decodable>: NetworkServiceProtocol {
    var result: Result<Type>?
    
    func request<T>(with requestData: RequestData,
                    responseType: T.Type,
                    handler: @escaping (Result<T>) -> Void) where T: Decodable {
        handler(self.result as! Result<T>)
    }
}
