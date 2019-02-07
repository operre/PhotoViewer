//
//  PhotoListViewMock.swift
//  PhotoViewerTests
//
//  Created by Ohanna Perre on 07/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import Foundation
@testable import PhotoViewer

class PhotoListViewMockToPresenter: PhotoListViewProtocol {
    var title: String?
    var photos: [Photo]?
    var didCallStartLoading: Bool = false
    var didCallStopLoading: Bool = false
    var didCallEmptyState: Bool = false
    var didCallShowAlert: Bool = false
    
    func load(title: String) {
        self.title = title
    }
    
    func startLoading() {
        self.didCallStartLoading = true
    }
    
    func stopLoading() {
        self.didCallStopLoading = true
    }
    
    func load(photos: [Photo]) {
        self.photos = photos
    }
    
    func showEmptyState() {
        self.didCallEmptyState = true
    }
    
    func showAlert(title: String, message: String, actionTitle: String, handler: @escaping () -> Void) {
        self.didCallShowAlert = true
    }
}
