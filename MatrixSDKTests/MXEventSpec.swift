//
//  MXEventTests.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 12/06/16.
//  Copyright © 2016 Gustavo Perdomo. All rights reserved.
//

import Foundation
import Quick
import Nimble
import ObjectMapper
@testable import MatrixSDK

class MXEventSpec: QuickSpec {
    let data : [String: Any] = [
        "age": 242352,
        "content": [
            "aliases": [
                "#somewhere:localhost",
                "#another:localhost"
            ]
        ],
        "event_id": "$WLGTSEFSEF:localhost",
        "origin_server_ts": 1431961217939,
        "room_id": "!Cuyf34gef24t:localhost",
        "sender": "@example:localhost",
        "state_key": "localhost",
        "type": "m.room.aliases"
    ]
    
    let otherData : [String: Any] = [
        "age": 242352,
        "content": [
            "aliases": [
                "#somewhere:localhost",
                "#another:localhost"
            ]
        ],
        "event_id": "$WLGTSEFSEF:localhost",
        "origin_server_ts": 1312963747939,
        "room_id": "!Cuyf34gef24t:localhost",
        "sender": "@example:localhost",
        "state_key": "localhost",
        "type": "m.room.aliases"
    ]
    
    let badData = [
        "errcode": "M_FORBIDDEN"
    ]
    
    override func spec() {
        describe("MXEvent - Mappable") {
            it("parse room alias json data to MXEvent") {
                let event: MXEvent? = Mapper<MXEvent>().map(JSON: self.data)
                
                expect(event).notTo(beNil())
                expect(event!.age).to(equal(242352))
                expect(event!.id).to(equal("$WLGTSEFSEF:localhost"))
                expect(event!.originServerTS).to(equal(UInt64(1431961217939)))
                expect(event!.roomId).to(equal("!Cuyf34gef24t:localhost"))
                expect(event!.sender).to(equal("@example:localhost"))
                expect(event!.stateKey).to(equal("localhost"))
                expect(event!.type).to(equal(EventType.roomAliases))
            }
            
            it("it can't map without 'type' property") {
                let error: MXEvent? = Mapper<MXEvent>().map(JSON: self.badData)
                
                expect(error).to(beNil())
            }
        }
        
        describe("MXEvent - Methods") {
            it("compare origin server timestamp properly"){
                let event: MXEvent? = Mapper<MXEvent>().map(JSON: self.data)
                let otherEvent: MXEvent? = Mapper<MXEvent>().map(JSON: self.otherData)
                
                let result: ComparisonResult = event!.compareOriginServerTs(with: otherEvent!)
                
                expect(result).to(equal(ComparisonResult.orderedAscending))
            }
        }
    }
}
