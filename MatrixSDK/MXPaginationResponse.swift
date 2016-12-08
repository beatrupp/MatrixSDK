//
//  MXPaginationResponse.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 12/8/16.
//  Copyright © 2016 Gustavo Perdomo. All rights reserved.
//

import Foundation
import ObjectMapper

/// Represents a response from an api that supports pagination
class MXPaginationResponse<T:Mappable>: Mappable {
    // MARK: Properties
    
    /// An array of MXEvents.
    private(set) var chunk: [T]!
    
    /// The opaque token for the start.
    private(set) var start: String?
    
    /// The opaque token for the end.
    private(set) var end: String?
    
    // MARK: Mappable
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        chunk <- map["chunk"]
        start <- map["start"]
        end <- map["end"]
        
        if chunk == nil {
            chunk = []
        }
    }
}
