//
//  NetworkError.swift
//  PhotoViewer
//
//  Created by Ohanna Perre on 02/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case emptyResponse
    case unableToSerialize
}
