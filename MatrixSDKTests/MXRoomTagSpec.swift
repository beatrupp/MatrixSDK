//
//  MXRoomTagSpec.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 12/13/16.
//  Copyright © 2016 Gustavo Perdomo. All rights reserved.
//

import Foundation
import Quick
import Nimble
import ObjectMapper
@testable import MatrixSDK

class MXRoomTagSpec: QuickSpec {
    let eventData: [String: Any] = [
        "type": "m.tag",
        "content": [
            "tags": [
                "work": [
                    "order": 1
                ],
                "office": [
                    "order": 2
                ],
                "noOrder": []
            ]
        ]
    ]
    
    override func spec() {
        describe("MXRoomTag") {
            var event: MXEvent?
            
            beforeEach {
                event = Mapper<MXEvent>().map(JSON: self.eventData)
            }
            
            describe("MXRoomTag - Mappable") {
                it("it's initialized properly") {
                    let tag = MXRoomTag(name: "TAG", order: 1)
                    expect(tag).notTo(beNil())
                    expect(tag.name).to(equal("TAG"))
                    expect(tag.order).to(equal(1))
                }
                
                it("it's initialized without order") {
                    let tag = MXRoomTag(name: "TAG", order: nil)
                    expect(tag).notTo(beNil())
                    expect(tag.name).to(equal("TAG"))
                    expect(tag.order).to(beNil())
                }
                
                it("parse response json m.tag event to list of tags") {
                    let tags = MXRoomTag.roomTagsWithTagEvent(event: event!)
                    expect(tags).notTo(beNil())
                    expect(tags.count).to(equal(3))
                    
                    let work: MXRoomTag = tags["work"]!
                    expect(work.name).to(equal("work"))
                    expect(work.order).to(equal(1))
                    
                    let office: MXRoomTag = tags["office"]!
                    expect(office.name).to(equal("office"))
                    expect(office.order).to(equal(2))
                    
                    let noOrder: MXRoomTag = tags["noOrder"]!
                    expect(noOrder.name).to(equal("noOrder"))
                    expect(noOrder.order).to(beNil())
                }
            }
        }
    }
}
