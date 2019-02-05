//
//  DetailedPhoto.swift
//  PhotoViewer
//
//  Created by Ohanna Perre on 05/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import Foundation

struct DetailedPhoto {
    let photo: Photo
    let title: String
    let description: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.photo = try container.decode(Photo.self, forKey: .rootNode)
        
        let photoContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .rootNode)
        
        let titleContainer = try photoContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .title)
        self.title = try titleContainer.decode(String.self, forKey: .content)
        
        let descriptionContainer = try photoContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .description)
        self.description = try descriptionContainer.decode(String.self, forKey: .content)
    }
}

extension DetailedPhoto: Decodable {
    enum CodingKeys: String, CodingKey {
        case rootNode = "photo"
        case content = "_content"
        case title
        case description
    }
}
