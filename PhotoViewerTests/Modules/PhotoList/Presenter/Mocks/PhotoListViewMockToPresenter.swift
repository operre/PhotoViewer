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
    var titleSetted: String?
    var photosSetted: [Photo]?
    var didLoadingStart: Bool = false
    var didLoadingStop: Bool = false
    var wasEmptyStateDisplayed: Bool = false
    var wasAlertDisplayed: Bool = false
    
    func load(title: String) {
        self.titleSetted = title
    }
    
    func startLoading() {
        self.didLoadingStart = true
    }
    
    func stopLoading() {
        self.didLoadingStop = true
    }
    
    func load(photos: [Photo]) {
        self.photosSetted = photos
    }
    
    func showEmptyState() {
        self.wasEmptyStateDisplayed = true
    }
    
    func showAlert(title: String, message: String, actionTitle: String, handler: @escaping () -> Void) {
        self.wasAlertDisplayed = true
    }
}
