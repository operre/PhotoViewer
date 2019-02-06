//
//  PhotoListRouter.swift
//  PhotoViewer
//
//  Created by Ohanna Perre on 05/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import UIKit

protocol PhotoListRouterProtocol {
    func routeToPhotoDetailView(from photoListView: PhotoListViewProtocol, given photoID: String)
}

struct PhotoListRouter: PhotoListRouterProtocol {
    func routeToPhotoDetailView(from photoListView: PhotoListViewProtocol, given photoID: String) {
        guard let viewController = photoListView as? UIViewController else {
            return
        }
        
        let photoDetailView = PhotoDetailBuilder.makePhotoDetailView(using: photoID)
        viewController.navigationController?.pushViewController(photoDetailView, animated: true)
    }
}
