//
//  MockedRequestData.swift
//  PhotoViewerTests
//
//  Created by Ohanna Perre on 06/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import Foundation
@testable import PhotoViewer

enum RequestDataMock: RequestData {
    case invalidData
    
    var method: HTTPMethod {
        return .get
    }
    
    var host: String {
        return ""
    }
    
    var path: String {
        return ""
    }
    
    var queryParameters: [String : String]? {
        return nil
    }
}
