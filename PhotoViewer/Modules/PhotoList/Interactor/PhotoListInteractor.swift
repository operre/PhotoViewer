//
//  PhotoListInteractor.swift
//  PhotoViewer
//
//  Created by Ohanna Perre on 03/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import Foundation

protocol PhotoListInteractorProtocol {
    func fetchPhotos(callback: @escaping (Result<[Photo]>) -> Void)
}

struct PhotoListInteractor: PhotoListInteractorProtocol {
    private let networkService: NetworkServiceProtocol
    
    init(with networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchPhotos(callback: @escaping (Result<[Photo]>) -> Void) {
        self.networkService.request(with: PhotoRequestData.getPhotos, responseType: PhotosWrapper.self) { result in
            switch result {
            case .success(let wrapper):
                guard let wrapper = wrapper else {
                    callback(.error(nil))
                    return
                }
                
                callback(.success(wrapper.photos))
            case .error(let error):
                callback(.error(error))
            }
        }
    }
}
