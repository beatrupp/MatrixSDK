/**
 *  MXErrorSpec.swift
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

class MXErrorSpec: QuickSpec {
    let data1 = [
        "errcode": "M_FORBIDDEN",
        "error": "forbidden"
    ]
    
    let data2 = [
        "errcode": "M_UNKNOWN_TOKEN"
    ]
    
    let data3 = [
        "error": "error message"
    ]
    
    override func spec() {
        describe("MODEL: MXError") {
            describe("INITIALIZERS") {
                context("Basic") {
                    it("It can be build with MXErrorCode and error message") {
                        let error = MXError(code: MXErrorCode(rawValue: "M_UNKNOWN_TOKEN")!, error: "unknown token")
                        
                        expect(error).notTo(beNil())
                        expect(error.code.rawValue).to(equal("M_UNKNOWN_TOKEN"))
                        expect(error.code).to(equal(MXErrorCode.unknownToken))
                        expect(error.error).to(equal("unknown token"))
                    }
                    
                    it("It can be build with string error code and error message") {
                        let error = MXError(code: "M_UNKNOWN_TOKEN", error: "unknown token")
                        
                        expect(error).notTo(beNil())
                        expect(error.code.rawValue).to(equal("M_UNKNOWN_TOKEN"))
                        expect(error.code).to(equal(MXErrorCode.unknownToken))
                        expect(error.error).to(equal("unknown token"))
                    }
                    
                    it("It error message is optional") {
                        let error = MXError(code: MXErrorCode(rawValue: "M_FORBIDDEN")!)
                        
                        expect(error).notTo(beNil())
                        expect(error.code.rawValue).to(equal("M_FORBIDDEN"))
                        expect(error.code).to(equal(MXErrorCode.forbidden))
                        expect(error.error).to(beNil())
                    }
                }
                
                context("from Mapping") {
                    it("is initializable from JSON data") {
                        var data = fixture(MXError.self, parameters: ["code": "M_FORBIDDEN", "error": "error message"])
                        var error: MXError = Mapper<MXError>().map(JSON: data)!
                        
                        expect(error).notTo(beNil())
                        expect(error.code).to(equal(MXErrorCode.forbidden))
                        expect(error.code.rawValue).to(equal("M_FORBIDDEN"))
                        expect(error.error).to(equal("error message"))
                        
                        data = fixture(MXError.self, parameters: ["code": "M_UNKNOWN_TOKEN", "error": "error message"])
                        error = Mapper<MXError>().map(JSON: data)!
                        
                        expect(error).notTo(beNil())
                        expect(error.code.rawValue).to(equal("M_UNKNOWN_TOKEN"))
                        expect(error.code).to(equal(MXErrorCode.unknownToken))
                    }
                    
                    it("it can't map without errcode") {
                        var data = fixture(MXError.self)
                        data["errcode"] = nil
                        
                        let error: MXError? = Mapper<MXError>().map(JSON: data)
                        expect(error).to(beNil())
                    }
                }
            }
        }
    }
}
