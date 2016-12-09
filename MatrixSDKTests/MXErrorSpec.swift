//
//  MXErrorSpec.swift
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

class MXErrorSpec: QuickSpec {
    let data = [
        "errcode": "M_FORBIDDEN",
        "error": "ERROR"
    ]
    
    let badData = [
        "errcode": "M_FORBIDDEN"
    ]
    
    override func spec() {
        describe("MXError") {
            it("parse json data to MXError") {
                let error: MXError? = Mapper<MXError>().map(JSON: self.data)
                
                expect(error).notTo(beNil())
                expect(error!.code).to(equal("M_FORBIDDEN"))
                expect(error!.error).to(equal("ERROR"))
            }
            
            it("it can't map without error") {
                let error: MXError? = Mapper<MXError>().map(JSON: self.badData)
                
                expect(error).to(beNil())
            }
        }
    }
}
