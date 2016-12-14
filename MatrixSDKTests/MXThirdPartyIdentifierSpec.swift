//
//  MXThirdPartyIdentifierSpec.swift
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

class MXThirdPartyIdentifierSpec: QuickSpec {
    let data: [String: Any] = [
        "medium": "email",
        "address": "user@example.com"
    ]
    
    let badData: [String: Any] = [
        "address": "user@example.com"
    ]
    
    override func spec() {
        describe("MXThirdPartyIdentifier") {
            var identifier: MXThirdPartyIdentifier?
            
            beforeEach {
                identifier = Mapper<MXThirdPartyIdentifier>().map(JSON: self.data)
            }
            
            describe("MXThirdPartyIdentifier - Mappable") {
                it("parse response json data to MXThirdPartyIdentifier") {
                    expect(identifier).notTo(beNil())
                    expect(identifier!.medium).to(equal("email"))
                    expect(identifier!.address).to(equal("user@example.com"))
                }
                
                it("it can't map with bad data") {
                    identifier = Mapper<MXThirdPartyIdentifier>().map(JSON: self.badData)
                    expect(identifier).to(beNil())
                }
            }
        }
    }
}
