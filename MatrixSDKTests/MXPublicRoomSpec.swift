//
//  MXPublicRoom.swift
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

class MXPublicRoomSpec: QuickSpec {
    let data: [String: Any] = [
        "canonical_alias": "#gerenal:zboxapp.com",
        "name": "Canal de Todos ZBox / ITLinux",
        "world_readable": false,
        "topic": "Se viene el nuevo **ZBox Now**",
        "num_joined_members": 11,
        "avatar_url": "mxc://zboxapp.com/uErgNRgGlvTcVIFXZiUjStVH",
        "room_id": "!YUUripELxWqHkQAkNp:zboxapp.com",
        "guest_can_join": false,
        "aliases": [
            "#gerenal:zboxapp.com"
        ]
    ]
    
    override func spec() {
        describe("MXPublicRoom - Mappable") {
            it("parse room json data to MXPublicRoom") {
                let room: MXPublicRoom? = Mapper<MXPublicRoom>().map(JSON: self.data)
                
                expect(room).notTo(beNil())
                expect(room!.name).to(equal("Canal de Todos ZBox / ITLinux"))
                expect(room!.worldReadable).to(beFalse())
                expect(room!.topic).to(equal("Se viene el nuevo **ZBox Now**"))
                expect(room!.numJoinedMembers).to(equal(11))
                expect(room!.avatarUrl).to(equal("mxc://zboxapp.com/uErgNRgGlvTcVIFXZiUjStVH"))
                expect(room!.id).to(equal("!YUUripELxWqHkQAkNp:zboxapp.com"))
                expect(room!.guestCanJoin).to(beFalse())
                expect(room!.aliases?.count).to(equal(1))
                expect(room!.aliases).to(equal(["#gerenal:zboxapp.com"]))
            }
        }
    }
}
