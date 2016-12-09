//
//  MXRoomMemberEventContent.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 12/8/16.
//  Copyright © 2016 Gustavo Perdomo. All rights reserved.
//

import Foundation
import ObjectMapper

/// Represents the content of a m.room.member event
class MXRoomMemberEventContent: Mappable {
    // MARK: Properties
    
    /// The display name for this user, if any. This is added by the homeserver
    private(set) var displayName: String?
    
    /// The avatar URL for this user, if any. This is added by the homeserver.
    private(set) var avatarUrl: String?
    
    /// The membership state of the user.
    private(set) var membership: MembershipType!
    
    /// If the m.room.member event is the successor of a m.room.third_party_invite event,
    /// 'thirdPartyInviteToken' is the token of this event. Else, nil.
    private(set) var thirdPartyInviteToken: String?
    
    // MARK: Mappable
    required init?(map: Map) {
        if map.JSON["membership"] == nil {
            return nil
        }
    }
    
    func mapping(map: Map) {
        displayName <- map["displayname"]
        avatarUrl <- map["avatar_url"]
        membership <- map["membership"]
        thirdPartyInviteToken <- map["third_party_invite.signed.token"]
    }
}
