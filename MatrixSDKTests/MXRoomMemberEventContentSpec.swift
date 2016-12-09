//
//  MXRoomMemberEventContentSpec.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 12/8/16.
//  Copyright © 2016 Gustavo Perdomo. All rights reserved.
//

import Foundation
import Quick
import Nimble
import ObjectMapper
@testable import MatrixSDK

class MXRoomMemberEventContentSpec: QuickSpec {
    let data: [String: Any] = [
        "displayname": "DISPLAY_NAME",
        "avatar_url": "AVATAR_URL",
        "membership": "join",
        "third_party_invite": [
            "signed": [
                "token": "TOKEN"
            ]
        ]
    ]
    
    let badData: [String: Any] = [
        "room_alias": "ROOM_ALIAS"
    ]
    
    override func spec() {
        describe("MXRoomMemberEventContent") {
            var response: MXRoomMemberEventContent?
            
            beforeEach {
                response = Mapper<MXRoomMemberEventContent>().map(JSON: self.data)
            }
            
            describe("MXRoomMemberEventContent - Mappable") {
                it("parse response json data to MXRoomMemberEventContent") {
                    expect(response).notTo(beNil())
                    expect(response!.displayName).to(equal("DISPLAY_NAME"))
                    expect(response!.avatarUrl).to(equal("AVATAR_URL"))
                    expect(response!.thirdPartyInviteToken).to(equal("TOKEN"))
                    expect(response!.membership).to(equal(MembershipType.join))
                }
                
                it("it can't map with bad data") {
                    response = Mapper<MXRoomMemberEventContent>().map(JSON: self.badData)
                    expect(response).to(beNil())
                }
            }
        }
    }
}
