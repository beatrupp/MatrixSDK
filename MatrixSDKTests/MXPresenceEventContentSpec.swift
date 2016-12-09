//
//  MXPresenceEventContentSpec.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 12/9/16.
//  Copyright © 2016 Gustavo Perdomo. All rights reserved.
//

import Foundation
import Quick
import Nimble
import ObjectMapper
@testable import MatrixSDK

class MXPresenceEventContentSpec: QuickSpec {
    let data: [String: Any] = [
        "avatar_url": "mxc://localhost:wefuiwegh8742w",
        "currently_active": false,
        "last_active_ago": 2478593,
        "presence": "online",
        "user_id": "@example:localhost",
        "displayname": "NAME"
    ]
    
    let badData: [String: Any] = [
        "avatar_url": "mxc://localhost:wefuiwegh8742w",
        "currently_active": false,
        "last_active_ago": 2478593,
        "user_id": "@example:localhost"
    ]
    
    override func spec() {
        describe("MXPresenceEventContent") {
            var response: MXPresenceEventContent?
            
            beforeEach {
                response = Mapper<MXPresenceEventContent>().map(JSON: self.data)
            }
            
            describe("MXPresenceEventContent - Mappable") {
                it("parse response json data to MXPresenceEventContent") {
                    expect(response).notTo(beNil())
                    expect(response!.avatarUrl).to(equal("mxc://localhost:wefuiwegh8742w"))
                    expect(response!.currentlyActive).to(beFalse())
                    expect(response!.lastActiveAgo).to(equal(2478593))
                    expect(response!.presence).to(equal(PresenceType.online))
                    expect(response!.userId).to(equal("@example:localhost"))
                    expect(response!.displayName).to(equal("NAME"))
                }
                
                it("it can't map with bad data") {
                    response = Mapper<MXPresenceEventContent>().map(JSON: self.badData)
                    expect(response).to(beNil())
                }
            }
        }
    }
}
