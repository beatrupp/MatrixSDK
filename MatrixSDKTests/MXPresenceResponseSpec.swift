//
//  MXPresenceResponseSpec.swift
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

class MXPresenceResponseSpec: QuickSpec {
    let data: [String: Any] = [
        "presence": "unavailable",
        "last_active_ago": 420845,
        "status_msg": "STATUS_MSG"
    ]
    
    let badData: [String: Any] = [
        "room_alias": "ROOM_ALIAS"
    ]
    
    override func spec() {
        describe("MXCreateRoomResponse") {
            var response: MXPresenceResponse?
            
            beforeEach {
                response = Mapper<MXPresenceResponse>().map(JSON: self.data)
            }
            
            describe("MXPresenceResponse - Mappable") {
                it("parse response json data to MXPresenceResponse") {
                    expect(response).notTo(beNil())
                    expect(response!.presence).to(equal(PresenceType.unavailable))
                    expect(response!.lastActiveAgo).to(equal(420845))
                    expect(response!.statusMsg).to(equal("STATUS_MSG"))
                }
                
                it("it can't map with bad data") {
                    response = Mapper<MXPresenceResponse>().map(JSON: self.badData)
                    expect(response).to(beNil())
                }
            }
        }
    }
}
