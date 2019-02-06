//
//  PhotoListBuilder.swift
//  PhotoViewer
//
//  Created by Ohanna Perre on 05/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import Foundation

struct PhotoListBuilder {
    static func makePhotoListView() -> PhotoListView {
        let parser = JSONParser()
        let networkService = NetworkService(parser: parser)
        let interactor = PhotoListInteractor(with: networkService)
        let router = PhotoListRouter()
        let presenter = PhotoListPresenter(with: interactor, router)
        return PhotoListView(with: presenter)
    }
}
