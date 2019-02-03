//
//  URL+QueryParameters.swift
//  PhotoViewer
//
//  Created by Ohanna Perre on 02/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import Foundation

extension URL {
    mutating func append(queryParameters: [String: String]?) {
        guard let queryParameters = queryParameters,
            var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true) else {
                return
        }
        
        var queryItems: [URLQueryItem] = urlComponents.queryItems ?? []
        queryItems.append(contentsOf: queryParameters.map{ URLQueryItem(name: $0, value: $1) })
        urlComponents.queryItems = queryItems
        self = urlComponents.url!
    }
}
