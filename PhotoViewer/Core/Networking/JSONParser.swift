//
//  JSONParser.swift
//  PhotoViewer
//
//  Created by Ohanna Perre on 02/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import Foundation

protocol JSONParserProtocol {
    func parse<T: Decodable>(from: Data) -> T?
}

struct JSONParser: JSONParserProtocol {
    func parse<T: Decodable>(from data: Data) -> T? {
        let decoder = JSONDecoder()
        guard let entity = try? decoder.decode(T.self, from: data) else {
            return nil
        }
        
        return entity
    }
}
