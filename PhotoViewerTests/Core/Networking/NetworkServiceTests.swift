//
//  NetworkServiceTests.swift
//  PhotoViewerTests
//
//  Created by Ohanna Perre on 06/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import XCTest
@testable import PhotoViewer

class NetworkServiceTests: XCTestCase {

    func testRequestPhotosWithSuccess() {
        // Given
        let mockedResult: [Photo]? = [Photo(id: "1234"), Photo(id: "5678")]
        
        var parserMock = JSONPaserMock()
        parserMock.parsedData = mockedResult
        
        let sessionMock = URLSessionMock()
        sessionMock.data = Data()
        
        let networkService = NetworkService(parser: parserMock, session: sessionMock)
        let requestData = PhotosRequestData.getPhotos("Teste")
        
        // When
        networkService.request(with: requestData, responseType: [Photo].self) { result in
            switch result {
            case .success(let photos):
                // Then
                XCTAssertEqual(photos, mockedResult)
            case .error:
                XCTFail()
            }
        }
    }
    
    func testRequestPhotosWithError() {
        // Given
        let mockedError = MockedError.anyError
        
        let sessionMock = URLSessionMock()
        sessionMock.error = mockedError
        
        let parserMock = JSONPaserMock()
        let networkService = NetworkService(parser: parserMock, session: sessionMock)
        let requestData = PhotosRequestData.getPhotos("Teste")
        
        // When
        networkService.request(with: requestData, responseType: [Photo].self) { result in
            switch result {
            case .success:
                XCTFail()
            case .error(let error):
                // Then
                XCTAssertEqual(mockedError, error as! MockedError)
            }
        }
    }
    
    func testRequestPhotosWithInvalidURL() {
        // Given
        let sessionMock = URLSessionMock()
        let parserMock = JSONPaserMock()
        let networkService = NetworkService(parser: parserMock, session: sessionMock)
        let requestData = RequestDataMock.invalidData
        let expectedError = NetworkError.invalidURL
        
        // When
        networkService.request(with: requestData, responseType: [Photo].self) { result in
            switch result {
            case .success:
                XCTFail()
            case .error(let error):
                // Then
                XCTAssertEqual(expectedError, error as! NetworkError)
            }
        }
    }
    
    func testRequestPhotosWithEmptyResponse() {
        // Given
        let sessionMock = URLSessionMock()
        let parserMock = JSONPaserMock()
        let networkService = NetworkService(parser: parserMock, session: sessionMock)
        let requestData = PhotosRequestData.getPhotos("Teste")
        let expectedError = NetworkError.emptyResponse
        
        // When
        networkService.request(with: requestData, responseType: [Photo].self) { result in
            switch result {
            case .success:
                XCTFail()
            case .error(let error):
                // Then
                XCTAssertEqual(expectedError, error as! NetworkError)
            }
        }
    }
    
    func testRequestPhotosWithNotSerializableResponse() {
        // Given
        let sessionMock = URLSessionMock()
        sessionMock.data = Data()
        
        let parserMock = JSONPaserMock()
        let networkService = NetworkService(parser: parserMock, session: sessionMock)
        let requestData = PhotosRequestData.getPhotos("Teste")
        let expectedError = NetworkError.unableToSerialize
        
        // When
        networkService.request(with: requestData, responseType: [Photo].self) { result in
            switch result {
            case .success:
                XCTFail()
            case .error(let error):
                // Then
                XCTAssertEqual(expectedError, error as! NetworkError)
            }
        }
    }
    
    // MARK: - Error Implementation
    
    enum MockedError: Error {
        case anyError
    }
}

// MARK: - Photo Equatable

extension Photo: Equatable {
    public static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.id == rhs.id
    }
}
