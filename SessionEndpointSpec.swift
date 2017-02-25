/**
 *  SessionEndpointSpec.swift
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
import Moya
import MoyaObjectMapper
import MatrixSDK

//class SessionEndpointSpec: QuickSpec {
//    let successfulResponseClosure: (Session) -> EndpointSampleResponse = { target in
//        switch target {
//        case .login:
//            return .networkResponse(200, fixtureData(MXCredentials.self, parameters: target.parameters))
//        case .tokenRefresh:
//            return .networkResponse(200, Data())//fixture("TokenRefresh"))
//        case .logout:
//            return .networkResponse(200, Data())//fixture("Logout"))
//        }
//    }
//    
//    let failedResponseClosure: (Session) -> EndpointSampleResponse = { target in
//        switch target {
//        case .login:
//            return .networkResponse(403, fixtureData(MXError.self, parameters: ["code": MXErrorCode.forbidden]))
//        case .tokenRefresh:
//            return .networkResponse(200, Data())//fixture("TokenRefresh"))
//        case .logout:
//            return .networkResponse(200, Data())//fixture("Logout"))
//        }
//    }
//    
//    //.path(forResource: "fixture", ofType: "json")
//    
//    //let Method: Swift.Method
//    
//    /*let successfulResponseClosure: (Session) -> EndpointSampleResponse = { target in
//     switch target {
//     case .login:
//     return .networkResponse(200, fixture("LoginSuccess"))
//     case .tokenRefresh:
//     return .networkResponse(200, fixture("TokenRefresh"))
//     case .logout:
//     return .networkResponse(200, fixture("Logout"))
//     }
//     }*/
//    
//    //method = class_getClassMethod(Fixture as! Any, Selector("loginSuccess"))
//    
//    override func spec() {
//        let successfulProvider = TestProvider<Session>(responseClosure: successfulResponseClosure)
//        let failedProvider = TestProvider<Session>(responseClosure: failedResponseClosure)
//        
//        describe("GROUP: SESSION MANAGEMENT") {
//            describe("ENDPOINT: LOGIN") {
//                context("when login success") {
//                    it("map a MXCredentials") {
//                        waitUntil { done in
//                            successfulProvider.request(Session.login(username: "gperdomor", password: "12345")) {
//                                result in
//                                
//                                if case .success(let response) = result {
//                                    do {
//                                        let creds = try response.map(to: MXCredentials.self)
//                                        expect(creds).toNot(beNil())
//                                        expect(creds.userId).to(equal("@gperdomor:matrix.org"))
//                                    } catch {
//                                        // Force fail
//                                        expect(true).to(beFalse())
//                                    }
//                                    done()
//                                }
//                            }
//                        }
//                    }
//                }
//                
//                context("when login fails") {
//                    it("map a MXError") {
//                        waitUntil { done in
//                            failedProvider.request(Session.login(username: "gperdomor", password: "12345")) {
//                                result in
//                                
//                                if case .success(let response) = result {
//                                    do {
//                                        let error = try response.map(to: MXError.self)
//                                        expect(error).toNot(beNil())
//                                        expect(error.code).to(equal(MXErrorCode.M_FORBIDDEN))
//                                    } catch {
//                                        // Force fail
//                                        expect(true).to(beFalse())
//                                    }
//                                }
//                                done()
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
