//
//  PhotosWrapper.swift
//  PhotoViewer
//
//  Created by Ohanna Perre on 03/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import Foundation

struct PhotosWrapper {
    let photos: [Photo]
    
    init(photos: [Photo]) {
        self.photos = photos
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let photosContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .rootNode)
        self.photos = try photosContainer.decode([Photo].self, forKey: .photos)
    }
}

extension PhotosWrapper: Decodable {
    enum CodingKeys: String, CodingKey {
        case rootNode = "photos"
        case photos = "photo"
    }
}
