//
//  RequestData.swift
//  PhotoViewer
//
//  Created by Ohanna Perre on 02/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import Foundation

protocol RequestData {
    var method: HTTPMethod { get }
    var host: String { get }
    var path: String { get }
    var queryParameters: [String: String]? { get }
}
