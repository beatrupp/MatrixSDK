/**
 *  SessionManagementAPISpec.swift
 *  MatrixSDK
 *
 *  Created by Gustavo Perdomo on 2/27/17.
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
import Moya
import ObjectMapper
import MatrixSDK

class SessionManagementAPISpec: QuickSpec {
    override func spec() {
        describe("TARGET: SessionManagementAPI") {
            var target: SubTarget!
            
            context("Login") {
                beforeEach {
                    target = SessionManagementAPI.login(type: "m.login.password", password: "password", username: "gperdomor", medium: nil, address: nil)
                }
                
                /*it("uses correct baseURL") {
                 expect(target.baseURL) == URL(string: "http://example.com")!
                 }*/
                
                it("uses correct path") {
                    expect(target.path) == "/_matrix/client/r0/login"
                }
                
                it("uses correct parameter encoding.") {
                    expect(target.parameterEncoding is JSONEncoding) == true
                }
                
                it("uses correct parameters") {
                    expect(target.parameters?["type"] as? String) == "m.login.password"
                    expect(target.parameters?["user"] as? String) == "gperdomor"
                    expect(target.parameters?["password"] as? String) == "password"
                    expect(target.parameters?.count) == 3
                }
                
                it("uses correct method") {
                    expect(target.method) == Method.post
                }
                
                it("uses correct task") {
                    expect(String(describing: target.task)) == "request"
                }
                
                it("uses correct sample data") {
                    let expectedData = Data()
                    expect(target.sampleData).to(equal(expectedData))
                }
                
                it("uses correct validate") {
                    expect(target.validate) == false
                }
            }
            
            context("Logout") {
                beforeEach {
                    target = SessionManagementAPI.logout(accessToken: "1234567890")
                }
                
                /*it("uses correct baseURL") {
                 expect(target.baseURL) == URL(string: "http://example.com")!
                 }*/
                
                it("uses correct path") {
                    expect(target.path) == "/_matrix/client/r0/logout?access_token=1234567890"
                }
                
                it("uses correct parameter encoding.") {
                    expect(target.parameterEncoding is JSONEncoding) == true
                }
                
                it("uses correct parameters") {
                    expect(target.parameters).to(beNil())
                }
                
                it("uses correct method") {
                    expect(target.method) == Method.post
                }
                
                it("uses correct task") {
                    expect(String(describing: target.task)) == "request"
                }
                
                it("uses correct sample data") {
                    let expectedData = Data()
                    expect(target.sampleData).to(equal(expectedData))
                }
                
                it("uses correct validate") {
                    expect(target.validate) == false
                }
            }
            
            context("TokenRefresh") {
                beforeEach {
                    target = SessionManagementAPI.refreshToken(accessToken: "token", refreshToken: "12345")
                }
                
                /*it("uses correct baseURL") {
                 expect(target.baseURL) == URL(string: "http://example.com")!
                 }*/
                
                it("uses correct path") {
                    expect(target.path) == "/_matrix/client/r0/tokenrefresh?access_token=token"
                }
                
                it("uses correct parameter encoding.") {
                    expect(target.parameterEncoding is JSONEncoding) == true
                }
                
                it("uses correct parameters") {
                    expect(target.parameters?["refresh_token"] as? String) == "12345"
                    expect(target.parameters?.count) == 1
                }
                
                it("uses correct method") {
                    expect(target.method) == Method.post
                }
                
                it("uses correct task") {
                    expect(String(describing: target.task)) == "request"
                }
                
                it("uses correct sample data") {
                    let expectedData = Data()
                    expect(target.sampleData).to(equal(expectedData))
                }
                
                it("uses correct validate") {
                    expect(target.validate) == false
                }
            }
        }
    }
}
