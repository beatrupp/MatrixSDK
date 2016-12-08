//
//  MXPublicRoom.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 12/8/16.
//  Copyright © 2016 Gustavo Perdomo. All rights reserved.
//

import Foundation
import ObjectMapper

/// Represents a public room returned by the publicRoom request
class MXPublicRoom: Mappable {
    // MARK: Properties
    
    /// The ID of the room.
    private(set) var id: String!
    
    /// The name of the room, if any. May be nil.
    private(set) var name: String? {
        didSet {
            updateDisplayName()
        }
    }
    
    /// Aliases of the room.
    private(set) var aliases: [String]? {
        didSet {
            updateDisplayName()
        }
    }
    
    /// The topic of the room, if any. May be nil.
    private(set) var topic: String?
    
    /// The number of members joined to the room.
    private(set) var numJoinedMembers: Int = 0
    
    /// Whether the room may be viewed by guest users without joining.
    private(set) var worldReadable: Bool = false
    
    /// Whether guest users may join the room and participate in it.
    /// If they can, they will be subject to ordinary power level rules like any other user.
    private(set) var guestCanJoin: Bool = false
    
    /// The URL for the room's avatar. May be nil.
    private(set) var avatarUrl: String?
    
    /// The displayname of the room.
    private(set) var displayName: String!
    
    // MARK: Mappable
    required init?(map: Map) {
        if map.JSON["room_id"] == nil {
            return nil
        }
    }
    
    /// Initialize a new instance from JSON response
    ///
    /// - Parameter map: <#map description#>
    func mapping(map: Map) {
        id <- map["room_id"]
        name <- map["name"]
        aliases <- map["aliases"]
        topic <- map["topic"]
        numJoinedMembers <- map["num_joined_members"]
        worldReadable <- map["world_readable"]
        guestCanJoin <- map["guest_can_join"]
        avatarUrl <- map["avatar_url"]
    }
    
    /// The display name is computed from available information
    private func updateDisplayName() {
        if var displayname:String = name {
            if let _aliases = self.aliases, _aliases.count > 0, !displayname.hasPrefix("#") {
                displayname = "\(displayname) (\(_aliases[0]))"
            }
            
            self.displayName = displayname
        } else {
            if let _aliases = self.aliases, _aliases.count > 0 {
                self.displayName = _aliases[0]
            } else {
                self.displayName = self.id
            }
        }
    }
}
