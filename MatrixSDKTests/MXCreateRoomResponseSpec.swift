//
//  MXCreateRoomResponseSpec.swift
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

class MXCreateRoomResponseSpec: QuickSpec {
    let data: [String: Any] = [
        "room_id": "ROOM_ID",
        "room_alias": "ROOM_ALIAS"
    ]
    
    let badData: [String: Any] = [
        "room_alias": "ROOM_ALIAS"
    ]
    
    override func spec() {
        describe("MXCreateRoomResponse") {
            var response: MXCreateRoomResponse?
            
            beforeEach {
                response = Mapper<MXCreateRoomResponse>().map(JSON: self.data)
            }
            
            describe("MXCreateRoomResponse - Mappable") {
                it("parse response json data to MXCreateRoomResponse") {
                    expect(response).notTo(beNil())
                    expect(response!.roomId).to(equal("ROOM_ID"))
                    expect(response!.roomAlias).to(equal("ROOM_ALIAS"))
                }
                
                it("it can't map with bad data") {
                    response = Mapper<MXCreateRoomResponse>().map(JSON: self.badData)
                    expect(response).to(beNil())
                }
            }
        }
    }
}
