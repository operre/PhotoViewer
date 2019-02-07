//
//  PhotoListRouterTests.swift
//  PhotoViewerTests
//
//  Created by Ohanna Perre on 07/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import XCTest
@testable import PhotoViewer

class PhotoListRouterTests: XCTestCase {
    func testRouteToPhotoDetailView() {
        // Given
        let navigationControllerMock = NavigationControllerMock()
    
        let viewMock = PhotoListViewMockToRouter()
        viewMock.navigationControllerMock = navigationControllerMock
        
        let router = PhotoListRouter()
        
        // When
        router.routeToPhotoDetailView(from: viewMock, given: "")
        
        // Then
        XCTAssertTrue(navigationControllerMock.pushedViewController is PhotoDetailView)
    }
}
