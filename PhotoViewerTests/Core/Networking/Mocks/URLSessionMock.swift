//
//  URLSessionMock.swift
//  PhotoViewerTests
//
//  Created by Ohanna Perre on 06/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import Foundation
@testable import PhotoViewer

class URLSessionMock: URLSession {
    var data: Data?
    var response: URLResponse?
    var error: Error?
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        completionHandler(self.data, self.response, self.error)
        return URLSessionDataTaskMock()
    }
}

private class URLSessionDataTaskMock: URLSessionDataTask {
    override func resume() {}
}
