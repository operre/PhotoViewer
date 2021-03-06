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
    func handleSelection(for photo: Photo)
}

class PhotoListPresenter: PhotoListPresenterProtocol {
    private let interactor: PhotoListInteractorProtocol
    private let router: PhotoListRouterProtocol
    private weak var view: PhotoListViewProtocol!
    
    init(with interactor: PhotoListInteractorProtocol, _ router: PhotoListRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - Interface implementation
    
    func handleLoad(for view: PhotoListViewProtocol) {
        self.view = view
        self.view.load(title: Constants.pageTitle.rawValue)
        self.fetchPhotos()
    }
    
    func handleSelection(for photo: Photo) {
        self.router.routeToPhotoDetailView(from: self.view, given: photo.id)
    }
    
    // MARK: - Helpers
    
    private func fetchPhotos() {
        self.view.startLoading()
        
        self.interactor.fetchPhotos(with: Constants.initialSearch.rawValue) { [weak self] result in
            self?.view.stopLoading()
            
            switch result {
            case .success(let photos):
                guard let photos = photos else {
                    self?.showErrorAlert()
                    return
                }
                
                guard !photos.isEmpty else {
                    self?.view.showEmptyState()
                    return
                }
                
                self?.view.load(photos: photos)
            case .error:
                self?.showErrorAlert()
            }
        }
    }
    
    private func showErrorAlert() {
        self.view.showAlert(title: Constants.errorTitle.rawValue,
                            message: Constants.errorMessage.rawValue,
                            actionTitle: Constants.errorButtonTitle.rawValue) { [weak self] in
            self?.fetchPhotos()
        }
    }
}

extension PhotoListPresenter {
    enum Constants: String {
        case pageTitle = "Photos"
        case initialSearch = "Food recipes"
        case errorTitle = "Error"
        case errorMessage = "Could't fetch photos."
        case errorButtonTitle = "Try again"
    }
}
