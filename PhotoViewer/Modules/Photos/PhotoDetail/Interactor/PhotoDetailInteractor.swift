//
//  PhotoDetailInteractor.swift
//  PhotoViewer
//
//  Created by Ohanna Perre on 05/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import Foundation

protocol PhotoDetailInteractorProtocol {
    func fetchPhotoInfo(by id: String, callback: @escaping (Result<DetailedPhoto>) -> Void)
}

struct PhotoDetailInteractor: PhotoDetailInteractorProtocol {
    private let networkService: NetworkServiceProtocol
    
    init(with networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchPhotoInfo(by id: String, callback: @escaping (Result<DetailedPhoto>) -> Void) {
        self.networkService.request(with: PhotosRequestData.getInfo(id), responseType: DetailedPhoto.self) { result in
            switch result {
            case .success(let detailedPhoto):
                guard let detailedPhoto = detailedPhoto else {
                    callback(.error(nil))
                    return
                }

                callback(.success(detailedPhoto))
            case .error(let error):
                callback(.error(error))
            }
        }
    }
}
