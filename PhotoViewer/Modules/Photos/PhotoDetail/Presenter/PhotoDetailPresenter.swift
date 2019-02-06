//
//  PhotoDetailPresenter.swift
//  PhotoViewer
//
//  Created by Ohanna Perre on 05/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import Foundation

protocol PhotoDetailPresenterProtocol {
    func handleLoad(for view: PhotoDetailViewProtocol)
}

class PhotoDetailPresenter: PhotoDetailPresenterProtocol {
    private let interactor: PhotoDetailInteractorProtocol
    private weak var view: PhotoDetailViewProtocol!
    
    private let photoID: String
    
    init(with interactor: PhotoDetailInteractorProtocol, _ photoID: String) {
        self.interactor = interactor
        self.photoID = photoID
    }
    
    func handleLoad(for view: PhotoDetailViewProtocol) {
        self.view = view
    }
}
