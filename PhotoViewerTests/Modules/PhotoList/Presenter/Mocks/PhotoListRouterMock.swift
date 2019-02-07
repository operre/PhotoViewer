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
    var viewSetted: PhotoListViewProtocol?
    var photoIDSetted: String?
    
    func routeToPhotoDetailView(from photoListView: PhotoListViewProtocol, given photoID: String) {
        self.viewSetted = photoListView
        self.photoIDSetted = photoID
    }
}
