//
//  PhotoListViewMockToRouter.swift
//  PhotoViewerTests
//
//  Created by Ohanna Perre on 07/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import UIKit
@testable import PhotoViewer

class PhotoListViewMockToRouter: UIViewController, PhotoListViewProtocol {
    var navigationControllerMock: NavigationControllerMock?
    
    override var navigationController: UINavigationController? {
        return navigationControllerMock!
    }
    
    func load(title: String) {}
    func startLoading() {}
    func stopLoading() {}
    func load(photos: [Photo]) {}
    func showEmptyState() {}
    func showAlert(title: String, message: String, actionTitle: String, handler: @escaping () -> Void) {}
}
