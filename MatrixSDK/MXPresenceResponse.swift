//
//  MXPresenceResponse.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 12/8/16.
//  Copyright © 2016 Gustavo Perdomo. All rights reserved.
//

import Foundation
import ObjectMapper

/// Represents the content of a presence response
class MXPresenceResponse: Mappable {
    // MARK: Properties
    
    /// The timestamp of the last time the user has been active.
    private(set) var lastActiveAgo: UInt?
    
    /// The presence status string as provided by the home server
    private(set) var presence: PresenceType!
    
    /// The user status.
    private(set) var statusMsg: String?
    
    // MARK: Mappable
    required init?(map: Map) {
        if map.JSON["presence"] == nil {
            return nil
        }
    }
    
    func mapping(map: Map) {
        lastActiveAgo <- (map["last_active_ago"], UIntTransform())
        presence <- map["presence"]
        statusMsg <- map["status_msg"]
    }
}
