//
//  JSONParserMock.swift
//  PhotoViewerTests
//
//  Created by Ohanna Perre on 06/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import Foundation
@testable import PhotoViewer

struct JSONPaserMock: JSONParserProtocol {
    var parsedData: Decodable?
    
    func parse<T>(from: Data) -> T? where T : Decodable {
        return self.parsedData as? T
    }
}
