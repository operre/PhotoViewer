//
//  PhotoDetailBuilder.swift
//  PhotoViewer
//
//  Created by Ohanna Perre on 05/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import Foundation

struct PhotoDetailBuilder {
    static func makePhotoDetailView(using photoID: String) -> PhotoDetailView {
        let parser = JSONParser()
        let networkService = NetworkService(parser: parser)
        let interactor = PhotoDetailInteractor(with: networkService)
        let presenter = PhotoDetailPresenter(with: interactor, photoID)
        return PhotoDetailView(with: presenter)
    }
}
