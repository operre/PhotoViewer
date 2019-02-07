//
//  PhotoListInteractorMock.swift
//  PhotoViewerTests
//
//  Created by Ohanna Perre on 07/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import Foundation
@testable import PhotoViewer

struct PhotoListInteractorMock: PhotoListInteractorProtocol {
    var result: Result<[Photo]>?
    
    func fetchPhotos(with searchText: String, callback: @escaping (Result<[Photo]>) -> Void) {
        guard let result = self.result else {
            return
        }
        
        callback(result)
    }
}
