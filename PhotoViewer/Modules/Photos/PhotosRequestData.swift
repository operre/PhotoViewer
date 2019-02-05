//
//  PhotosRequestData.swift
//  PhotoViewer
//
//  Created by Ohanna Perre on 03/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import Foundation

enum PhotosRequestData: RequestData {
    case getPhotos(String) // Search Text
    case getInfo(String) // Photo ID
    
    var method: HTTPMethod {
        return .get
    }
    
    var host: String {
        return "https://api.flickr.com"
    }
    
    var path: String {
        return "/services/rest/"
    }
    
    var queryParameters: [String : String]? {
        var parameters: [String: String] = [:]
        parameters["api_key"] = "f9cc014fa76b098f9e82f1c288379ea1"
        parameters["format"] = "json"
        parameters["nojsoncallback"] = "1"
        
        switch self {
        case .getPhotos(let searchText):
            parameters["method"] = "flickr.photos.search"
            parameters["tags"] = searchText
        case .getInfo(let photoID):
            parameters["method"] = "flickr.photos.getInfo"
            parameters["photo_id"] = photoID
        }
        
        return parameters
    }
}
