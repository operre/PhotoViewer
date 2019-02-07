//
//  PhotoListInteractorTests.swift
//  PhotoViewerTests
//
//  Created by Ohanna Perre on 06/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import XCTest
@testable import PhotoViewer

class PhotoListInteractorTests: XCTestCase {

    func testFetchPhotosWithSuccess() {
        // Given
        let expectedResult = PhotosWrapper(photos: [Photo(id: "1234")])
        
        var networkServiceMock = NetworkServiceMock()
        networkServiceMock.result = expectedResult
        
        let interactor = PhotoListInteractor(with: networkServiceMock)
        
        // When
        interactor.fetchPhotos(with: "") { result in
            switch result {
            case .success(let photos):
                // Then
                XCTAssertEqual(photos, expectedResult.photos)
            case .error:
                XCTFail()
            }
        }
    }
    
    func testFetchPhotosWithError() {
        // Given
        let expectedError = MockedError.anyError
        
        var networkServiceMock = NetworkServiceMock()
        networkServiceMock.error = expectedError
        
        let interactor = PhotoListInteractor(with: networkServiceMock)
        
        // When
        interactor.fetchPhotos(with: "") { result in
            switch result {
            case .success:
                XCTFail()
            case .error(let error):
                // Then
                XCTAssertEqual(expectedError, error as! MockedError)
            }
        }
    }
    
    func testFetchPhotosWithSuccessButWithInvalidResult() {
        // Given
        let wrongResult = Photo(id: "1234")

        var networkServiceMock = NetworkServiceMock()
        networkServiceMock.result = wrongResult
        
        let interactor = PhotoListInteractor(with: networkServiceMock)
        
        // When
        interactor.fetchPhotos(with: "") { result in
            switch result {
            case .success:
                XCTFail()
            case .error(let error):
                // Then
                XCTAssertNil(error)
            }
        }
    }
    
    // MARK: - Error Implementation
    
    enum MockedError: Error {
        case anyError
    }
}
