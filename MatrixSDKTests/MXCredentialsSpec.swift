//
//  MXCredentialsSpec.swift
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

class MXCredentialsSpec: QuickSpec {
    let data = [
        "access_token": "ACCESS_TOKEN",
        "home_server": "HOMESERVER",
        "user_id": "USER_ID",
        "refresh_token": "REFRESH_TOKEN",
        "device_id": "DEVICE_ID"
    ]
    
    let badData = [
        "other": "Other"
    ]
    
    override func spec() {
        describe("MXCredentials") {
            it("parse json data to MXCredentials") {
                let credentials: MXCredentials? = Mapper<MXCredentials>().map(JSON: self.data)
                
                expect(credentials).notTo(beNil())
                expect(credentials!.accessToken).to(equal("ACCESS_TOKEN"))
                expect(credentials!.homeserver).to(equal("HOMESERVER"))
                expect(credentials!.userId).to(equal("USER_ID"))
                expect(credentials!.refreshToken).to(equal("REFRESH_TOKEN"))
                expect(credentials!.deviceId).to(equal("DEVICE_ID"))
            }
            
            it("it can't map with bad data") {
                let credentials: MXCredentials? = Mapper<MXCredentials>().map(JSON: self.badData)
                
                expect(credentials).to(beNil())
            }
        }
    }
}
