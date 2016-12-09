//
//  MXPresenceEventContent.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 12/8/16.
//  Copyright © 2016 Gustavo Perdomo. All rights reserved.
//

import Foundation
import ObjectMapper

class UIntTransform: TransformType {
    func transformFromJSON(_ value: Any?) -> UInt? {
        return UInt(value as! Int)
    }
    
    func transformToJSON(_ value: UInt?) -> UInt? {
        if let value = value {
            return value
        }
        return nil
    }
}

/// Represents the content of a presence event
class MXPresenceEventContent: Mappable {
    // MARK: Properties
    
    /// The user id.
    private(set) var userId: String!
    
    /// The current display name for this user, if any.
    private(set) var displayName: String?
    
    /// The url of the user of the avatar.
    private(set) var avatarUrl: String?
    
    ///The last time since this used performed some action, in milliseconds.
    private(set) var lastActiveAgo: UInt?
    
    /// Whether the user is currently active.
    /// If True, lastActiveAgo is an approximation and "Now" should be shown instead.
    private(set) var currentlyActive: Bool?
    
    /// The presence state for this user.
    private(set) var presence: PresenceType!
    
    /// The user status.
    private(set) var statusMsg: String?
    
    // MARK: Mappable
    required init?(map: Map) {
        if map.JSON["user_id"] == nil || map.JSON["presence"] == nil {
            return nil
        }
    }
    
    func mapping(map: Map) {
        userId <- map["user_id"]
        displayName <- map["displayname"]
        avatarUrl <- map["avatar_url"]
        lastActiveAgo <- (map["last_active_ago"], UIntTransform())
        currentlyActive <- map["currently_active"]
        presence <- map["presence"]
        statusMsg <- map["status_msg"]
    }
}
