//
//  Photo.swift
//  PhotoViewer
//
//  Created by Ohanna Perre on 03/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import Foundation

struct Photo: Decodable {
    let id: String
    
    enum CodingKeys: CodingKey {
        case id
    }
}
