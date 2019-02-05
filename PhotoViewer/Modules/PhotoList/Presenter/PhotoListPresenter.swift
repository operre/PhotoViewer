//
//  PhotoListPresenter.swift
//  PhotoViewer
//
//  Created by Ohanna Perre on 04/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import Foundation

protocol PhotoListPresenterProtocol {
    func handleLoad(for view: PhotoListViewProtocol)
}

class PhotoListPresenter: PhotoListPresenterProtocol {
    private let interactor: PhotoListInteractorProtocol
    private weak var view: PhotoListViewProtocol!
    
    init(with interactor: PhotoListInteractorProtocol) {
        self.interactor = interactor
    }
    
    func handleLoad(for view: PhotoListViewProtocol) {
        self.view = view
        
        self.view.startLoading()
        self.interactor.fetchPhotos { [weak self] result in
            self?.view.stopLoading()
            switch result {
            case .success(let photos):
                guard let photos = photos else {
                    self?.view.showAlert(title: Constants.errorTitle.rawValue, message: Constants.errorMessage.rawValue)
                    return
                }
                
                guard !photos.isEmpty else {
                    self?.view.showEmptyState()
                    return
                }
                
                self?.view.load(photos: photos)
            case .error:
                self?.view.showAlert(title: Constants.errorTitle.rawValue, message: Constants.errorMessage.rawValue)
            }
        }
    }
}

extension PhotoListPresenter {
    enum Constants: String {
        case errorTitle = "Error"
        case errorMessage = "Could't fetch photos."
    }
}
