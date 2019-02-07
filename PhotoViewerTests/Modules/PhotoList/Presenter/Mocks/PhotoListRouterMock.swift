//
//  PhotoListRouterMock.swift
//  PhotoViewerTests
//
//  Created by Ohanna Perre on 07/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import Foundation
@testable import PhotoViewer

class PhotoListRouterMock: PhotoListRouterProtocol {
    var view: PhotoListViewProtocol?
    var photoID: String?
    
    func routeToPhotoDetailView(from photoListView: PhotoListViewProtocol, given photoID: String) {
        self.view = photoListView
        self.photoID = photoID
    }
}
