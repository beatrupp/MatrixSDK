//
//  MXCosntants.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 12/06/16.
//  Copyright © 2016 Gustavo Perdomo. All rights reserved.
//

import Foundation

enum EventType: String, RawRepresentable {
    case roomName               = "m.room.name"
    case roomTopic              = "m.room.topic"
    case roomAvatar             = "m.room.avatar"
    case roomMember             = "m.room.member"
    case roomCreate             = "m.room.create"
    case roomJoinRules          = "m.room.join_rules"
    case roomPowerLevels        = "m.room.power_levels"
    case roomAliases            = "m.room.aliases"
    case roomCanonicalAlias     = "m.room.canonical_alias"
    case roomEncrypted          = "m.room.encrypted"
    case roomEncryption         = "m.room.encryption"
    case roomGuessAccess        = "m.room.guest_access"
    case roomHistoryVisibility  = "m.room.history_visibility"
    case roomKey                = "m.room_key"
    case roomMessage            = "m.room.message"
    case roomMessageFeedback    = "m.room.message.feedback"
    case roomRedaction          = "m.room.redaction"
    case roomThirdPartyInvite   = "m.room.third_party_invite"
    case tag                    = "m.tag"
    case presence               = "m.presence"
    case typing                 = "m.typing"
    case receipt                = "m.receipt"
    case read                   = "m.read"
    case newDevice              = "m.new_device"
    
    case callInvite             = "m.call.invite"
    case callCandidates         = "m.call.candidates"
    case callAnswer             = "m.call.answer"
    case callHangup             = "m.call.hangup"
}

enum MessageType: String, RawRepresentable {
    case text      = "m.text"
    case emote     = "m.emote"
    case notice    = "m.notice"
    case image     = "m.image"
    case audio     = "m.audio"
    case video     = "m.video"
    case location  = "m.location"
    case file      = "m.file"
}

enum PresenceType: String, RawRepresentable {
    case online      = "online"
    case offline     = "offline"
    case unavailable = "unavailable"
}

enum MembershipType: String, RawRepresentable {
    case invite = "invite"
    case join   = "join"
    case leave  = "leave"
    case ban    = "ban"
    case knock  = "knock"
}

/// Methods of thumbnailing supported by the Matrix content repository
///
/// - crop: crop the image
/// - scale: scale the image
enum ThumbnailingMethod: String {
    case crop  = "crop"
    case scale = "scale"
}
