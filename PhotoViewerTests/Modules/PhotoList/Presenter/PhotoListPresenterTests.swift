//
//  PhotoListPresenterTests.swift
//  PhotoViewerTests
//
//  Created by Ohanna Perre on 07/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import XCTest
@testable import PhotoViewer

class PhotoListPresenterTests: XCTestCase {
    
    // MARK: - HandleLoad tests
    
    func testHandleLoadWithAValidResult() {
        // Given
        let expectedPhotos = [Photo(id: "1234")]
        let mockedResult: Result<[Photo]> = .success(expectedPhotos)

        var interactorMock = PhotoListInteractorMock()
        interactorMock.result = mockedResult
        
        let routerMock = PhotoListRouterMock()
        let viewMock = PhotoListViewMock()
        let presenter = PhotoListPresenter(with: interactorMock, routerMock)
        
        // When
        presenter.handleLoad(for: viewMock)
        
        // Then
        XCTAssertTrue(viewMock.didLoadingStart)
        XCTAssertTrue(viewMock.didLoadingStop)
        XCTAssertEqual(viewMock.titleSetted, "Photos")
        
        XCTAssertEqual(viewMock.photosSetted, expectedPhotos)
        XCTAssertFalse(viewMock.wasAlertDisplayed)
        XCTAssertFalse(viewMock.wasEmptyStateDisplayed)
    }
    
    func testHandleLoadWithAnEmptyResult() {
        // Given
        let emptyResult: Result<[Photo]> = .success([])
        
        var interactorMock = PhotoListInteractorMock()
        interactorMock.result = emptyResult
        
        let routerMock = PhotoListRouterMock()
        let viewMock = PhotoListViewMock()
        let presenter = PhotoListPresenter(with: interactorMock, routerMock)
        
        // When
        presenter.handleLoad(for: viewMock)
        
        // Then
        XCTAssertTrue(viewMock.didLoadingStart)
        XCTAssertTrue(viewMock.didLoadingStop)
        XCTAssertEqual(viewMock.titleSetted, "Photos")
        
        XCTAssertNil(viewMock.photosSetted)
        XCTAssertTrue(viewMock.wasEmptyStateDisplayed)
        XCTAssertFalse(viewMock.wasAlertDisplayed)
    }
    
    func testHandleLoadWithAnInvalidResult() {
        // Given
        let invalidResult: Result<[Photo]> = .success(nil)
        
        var interactorMock = PhotoListInteractorMock()
        interactorMock.result = invalidResult
        
        let routerMock = PhotoListRouterMock()
        let viewMock = PhotoListViewMock()
        let presenter = PhotoListPresenter(with: interactorMock, routerMock)
        
        // When
        presenter.handleLoad(for: viewMock)
        
        // Then
        XCTAssertTrue(viewMock.didLoadingStart)
        XCTAssertTrue(viewMock.didLoadingStop)
        XCTAssertEqual(viewMock.titleSetted, "Photos")
        
        XCTAssertNil(viewMock.photosSetted)
        XCTAssertFalse(viewMock.wasEmptyStateDisplayed)
        XCTAssertTrue(viewMock.wasAlertDisplayed)
    }
    
    func testHandleLoadWithAnError() {
        // Given
        let expectedError = MockedError.anyError
        let mockedResult: Result<[Photo]> = .error(expectedError)
        
        var interactorMock = PhotoListInteractorMock()
        interactorMock.result = mockedResult
        
        let routerMock = PhotoListRouterMock()
        let viewMock = PhotoListViewMock()
        let presenter = PhotoListPresenter(with: interactorMock, routerMock)
        
        // When
        presenter.handleLoad(for: viewMock)
        
        // Then
        XCTAssertTrue(viewMock.didLoadingStart)
        XCTAssertTrue(viewMock.didLoadingStop)
        XCTAssertEqual(viewMock.titleSetted, "Photos")
        
        XCTAssertNil(viewMock.photosSetted)
        XCTAssertFalse(viewMock.wasEmptyStateDisplayed)
        XCTAssertTrue(viewMock.wasAlertDisplayed)
    }
    
    // MARK: - HandleSelection tests
    
    func testHandleSelection() {
        // Given
        let expectedPhoto = Photo(id: "1234")
        
        let viewMock = PhotoListViewMock()
        let interactorMock = PhotoListInteractorMock()
        let routerMock = PhotoListRouterMock()
        let presenter = PhotoListPresenter(with: interactorMock, routerMock)
        presenter.handleLoad(for: viewMock)
        
        // When
        presenter.handleSelection(for: expectedPhoto)
        
        // Then
        XCTAssertTrue(routerMock.viewSetted is PhotoListViewMock)
        XCTAssertEqual(routerMock.photoIDSetted, expectedPhoto.id)
    }
}
