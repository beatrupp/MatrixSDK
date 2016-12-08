//
//  MXError.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 12/06/16.
//  Copyright © 2016 Gustavo Perdomo. All rights reserved.
//

import Foundation
import ObjectMapper

/// Represents a Error response
class MXError: Mappable {
    
    /// The error code
    var code: String!
    
    /// The error message
    var error: String!
    
    init(code: String, error: String) {
        self.code = code
        self.error = error
    }
    
    init(error: String) {
        self.error = error
    }
    
    var description: String {
        return "\(code) - \(error)"
    }
    
    required init?(map: Map) {
        if map.JSON["error"] == nil {
            return nil
        }
    }
    
    /// Mappable
    func mapping(map: Map) {
        error <- map["error"]
        code <- map["errcode"]
    }
}
