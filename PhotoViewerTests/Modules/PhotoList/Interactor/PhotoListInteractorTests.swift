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
        let expectedPhotosWrapper = PhotosWrapper(photos: [Photo(id: "1234")])
        let mockedResult: Result<PhotosWrapper> = .success(expectedPhotosWrapper)
        
        var networkServiceMock = NetworkServiceMock<PhotosWrapper>()
        networkServiceMock.result = mockedResult
        
        let interactor = PhotoListInteractor(with: networkServiceMock)
        
        // When
        interactor.fetchPhotos(with: "") { result in
            switch result {
            case .success(let photos):
                // Then
                XCTAssertEqual(photos, expectedPhotosWrapper.photos)
            case .error:
                XCTFail()
            }
        }
    }
    
    func testFetchPhotosWithError() {
        // Given
        let expectedError = MockedError.anyError
        let mockedResult: Result<PhotosWrapper> = .error(expectedError)
        
        var networkServiceMock = NetworkServiceMock<PhotosWrapper>()
        networkServiceMock.result = mockedResult
        
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
    
    func testFetchPhotosWithSuccessButWithNilValue() {
        // Given
        let mockedResult: Result<PhotosWrapper> = .success(nil)

        var networkServiceMock = NetworkServiceMock<PhotosWrapper>()
        networkServiceMock.result = mockedResult

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
}
