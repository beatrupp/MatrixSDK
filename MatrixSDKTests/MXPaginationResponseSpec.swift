//
//  MXPaginationResponseSpec.swift
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

class MXPaginationResponseSpec: QuickSpec {
    let data: [String: Any] = [
        "next_batch": "hKFweKFzzgABtAmhZMOhbgE",
        "chunk": [
            [
                "canonical_alias": "#gerenal:zboxapp.com",
                "name": "Canal de Todos ZBox / ITLinux",
                "world_readable": false,
                "topic": "Se viene el nuevo **ZBox Now**",
                "num_joined_members": 11,
                "avatar_url": "mxc://zboxapp.com/uErgNRgGlvTcVIFXZiUjStVH",
                "room_id": "!YUUripELxWqHkQAkNp:zboxapp.com",
                "guest_can_join": false,
                "aliases": ["#gerenal:zboxapp.com"]
            ],
            [
                "canonical_alias": "#ingenieria:zboxapp.com",
                "name": "Ingeniería",
                "world_readable": false,
                "topic": "Temas Técnicos",
                "num_joined_members": 10,
                "avatar_url": "mxc://zboxapp.com/gjIJfPqqYIZffJhEeyGEGYKN",
                "room_id": "!FLzLGzbgSygIxVWBEo:zboxapp.com",
                "guest_can_join": false,
                "aliases": ["#ingenieria:zboxapp.com"]
            ]
        ],
        "start": "START",
        "end": "END"
    ]
    
    override func spec() {
        describe("MXPaginationResponse") {
            var response: MXPaginationResponse<MXPublicRoom>?
            
            beforeEach {
                response = Mapper<MXPaginationResponse<MXPublicRoom>>().map(JSON: self.data)
            }
            
            describe("MXPaginationResponse - Mappable") {
                it("parse response json data to MXPaginationResponse") {
                    expect(response).notTo(beNil())
                    expect(response!.start).to(equal("START"))
                    expect(response!.end).to(equal("END"))
                    expect(response!.chunk?.count).to(equal(2))
                }
                
                it("Parse chunk properly") {
                    let event = response!.chunk[0]
                    
                    expect(event).notTo(beNil())
                    expect(event.name).to(equal("Canal de Todos ZBox / ITLinux"))
                }
            }
        }
    }
}
