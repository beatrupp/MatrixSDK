/**
 *  MXCredentialsSpec.swift
 *  MatrixSDK
 *
 *  Created by Gustavo Perdomo on 2/23/17.
 *  Copyright (c) 2017 Gustavo Perdomo. Licensed under the MIT license, as follows:
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in all
 *  copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 *  SOFTWARE.
 */

import Foundation
import Quick
import Nimble
import ObjectMapper
import MatrixSDK

class MXCredentialsSpec: QuickSpec {
    override func spec() {
        describe("MODEL: MXCredentials") {
            describe("INITIALIZERS") {
                context("from Mapping") {
                    it("parse json data to MXCredentials") {
                        var data = fixture(MXCredentials.self, parameters: ["user": "gperdomor"])
                        var credentials: MXCredentials = Mapper<MXCredentials>().map(JSON: data)!
                        
                        expect(credentials).notTo(beNil())
                        expect(credentials.accessToken).to(equal("ACCESS_TOKEN"))
                        expect(credentials.homeserver).to(equal("matrix.org"))
                        expect(credentials.userId).to(equal("@gperdomor:matrix.org"))
                        expect(credentials.refreshToken).to(equal("REFRESH_TOKEN"))
                        expect(credentials.deviceId).to(equal("DEVICE_ID"))
                        
                        // Testing for refreshToken
                        data["home_server"] = nil
                        data["user_id"] = nil
                        data["device_id"] = nil
                        
                        credentials = Mapper<MXCredentials>().map(JSON: data)!
                        
                        expect(credentials).notTo(beNil())
                        expect(credentials.accessToken).to(equal("ACCESS_TOKEN"))
                        expect(credentials.homeserver).to(beNil())
                        expect(credentials.userId).to(beNil())
                        expect(credentials.refreshToken).to(equal("REFRESH_TOKEN"))
                        expect(credentials.deviceId).to(beNil())
                    }
                    
                    it("it can't map without access_token") {
                        var data = fixture(MXCredentials.self)
                        data["access_token"] = nil
                        
                        let credentials: MXCredentials? = Mapper<MXCredentials>().map(JSON: data)
                        expect(credentials).to(beNil())
                    }
                }
            }
        }
    }
}
