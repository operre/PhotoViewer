//
//  Photo.swift
//  PhotoViewer
//
//  Created by Ohanna Perre on 03/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import Foundation

struct Photo {
    private let farm: Int
    private let server: String
    private let secret: String
    
    let id: String
    var url: String {
        return "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_z.jpg"
    }
}

extension Photo: Decodable {
    enum CodingKeys: CodingKey {
        case id
        case farm
        case server
        case secret
    }
}
