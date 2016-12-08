//
//  MXCreateRoomResponse.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 12/8/16.
//  Copyright © 2016 Gustavo Perdomo. All rights reserved.
//

import Foundation
import ObjectMapper

/// Represents a Create Room response
class MXCreateRoomResponse: Mappable {
    // MARK: Properties
    
    /// The allocated room id.
    private(set) var roomId: String!
    
    /// The alias on this home server.
    private(set) var roomAlias: String!
    
    // MARK: Mappable
    required init?(map: Map) {
        if map.JSON["room_id"] == nil {
            return nil
        }
    }
    
    func mapping(map: Map) {
        roomId <- map["room_id"]
        roomAlias <- map["room_alias"]
    }
}
