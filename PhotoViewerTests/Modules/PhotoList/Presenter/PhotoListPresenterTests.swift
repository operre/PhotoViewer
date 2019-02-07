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
        let viewMock = PhotoListViewMockToPresenter()
        let presenter = PhotoListPresenter(with: interactorMock, routerMock)
        
        // When
        presenter.handleLoad(for: viewMock)
        
        // Then
        XCTAssertTrue(viewMock.didCallStartLoading)
        XCTAssertTrue(viewMock.didCallStopLoading)
        XCTAssertEqual(viewMock.title, "Photos")
        
        XCTAssertEqual(viewMock.photos, expectedPhotos)
        XCTAssertFalse(viewMock.didCallShowAlert)
        XCTAssertFalse(viewMock.didCallEmptyState)
    }
    
    func testHandleLoadWithAnEmptyResult() {
        // Given
        let emptyResult: Result<[Photo]> = .success([])
        
        var interactorMock = PhotoListInteractorMock()
        interactorMock.result = emptyResult
        
        let routerMock = PhotoListRouterMock()
        let viewMock = PhotoListViewMockToPresenter()
        let presenter = PhotoListPresenter(with: interactorMock, routerMock)
        
        // When
        presenter.handleLoad(for: viewMock)
        
        // Then
        XCTAssertTrue(viewMock.didCallStartLoading)
        XCTAssertTrue(viewMock.didCallStopLoading)
        XCTAssertEqual(viewMock.title, "Photos")
        
        XCTAssertNil(viewMock.photos)
        XCTAssertTrue(viewMock.didCallEmptyState)
        XCTAssertFalse(viewMock.didCallShowAlert)
    }
    
    func testHandleLoadWithAnInvalidResult() {
        // Given
        let invalidResult: Result<[Photo]> = .success(nil)
        
        var interactorMock = PhotoListInteractorMock()
        interactorMock.result = invalidResult
        
        let routerMock = PhotoListRouterMock()
        let viewMock = PhotoListViewMockToPresenter()
        let presenter = PhotoListPresenter(with: interactorMock, routerMock)
        
        // When
        presenter.handleLoad(for: viewMock)
        
        // Then
        XCTAssertTrue(viewMock.didCallStartLoading)
        XCTAssertTrue(viewMock.didCallStopLoading)
        XCTAssertEqual(viewMock.title, "Photos")
        
        XCTAssertNil(viewMock.photos)
        XCTAssertFalse(viewMock.didCallEmptyState)
        XCTAssertTrue(viewMock.didCallShowAlert)
    }
    
    func testHandleLoadWithAnError() {
        // Given
        let expectedError = MockedError.anyError
        let mockedResult: Result<[Photo]> = .error(expectedError)
        
        var interactorMock = PhotoListInteractorMock()
        interactorMock.result = mockedResult
        
        let routerMock = PhotoListRouterMock()
        let viewMock = PhotoListViewMockToPresenter()
        let presenter = PhotoListPresenter(with: interactorMock, routerMock)
        
        // When
        presenter.handleLoad(for: viewMock)
        
        // Then
        XCTAssertTrue(viewMock.didCallStartLoading)
        XCTAssertTrue(viewMock.didCallStopLoading)
        XCTAssertEqual(viewMock.title, "Photos")
        
        XCTAssertNil(viewMock.photos)
        XCTAssertFalse(viewMock.didCallEmptyState)
        XCTAssertTrue(viewMock.didCallShowAlert)
    }
    
    // MARK: - HandleSelection tests
    
    func testHandleSelection() {
        // Given
        let expectedPhoto = Photo(id: "1234")
        
        var interactorMock = PhotoListInteractorMock()
        interactorMock.result = .success(nil)
        
        let routerMock = PhotoListRouterMock()
        let presenter = PhotoListPresenter(with: interactorMock, routerMock)
        
        let viewMock = PhotoListViewMockToPresenter()
        presenter.handleLoad(for: viewMock)
        
        // When
        presenter.handleSelection(for: expectedPhoto)
        
        // Then
        XCTAssertTrue(routerMock.view is PhotoListViewMockToPresenter)
        XCTAssertEqual(routerMock.photoID, expectedPhoto.id)
    }
}
