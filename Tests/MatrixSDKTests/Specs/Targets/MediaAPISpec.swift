/**
 *  MediaAPISpec.swift
 *  MatrixSDK
 *
 *  Created by Gustavo Perdomo on 2/28/17.
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

class MediaAPISpec: QuickSpec {
    override func spec() {
        describe("TARGET: MediaAPI") {
            var target: SubTarget!
            var mediaId: String!
            var server: String!
            
            context("Download") {
                beforeEach {
                    mediaId = "mediaID"
                    server = "domain.com"
                    target = MediaAPI.download(media: mediaId, from: server)
                }
                
                /*it("uses correct baseURL") {
                 expect(target.baseURL) == URL(string: "http://example.com")!
                 }*/
                
                it("uses correct path") {
                    expect(target.path) == "/_matrix/media/r0/download/\(server!)/\(mediaId!)"
                }
                
                it("uses correct parameter encoding.") {
                    expect(target.parameterEncoding is URLEncoding) == true
                }
                
                it("uses correct parameters") {
                    expect(target.parameters).to(beNil())
                }
                
                it("uses correct method") {
                    expect(target.method) == Method.get
                }
                
                it("uses correct task") {
                    expect(String(describing: target.task).hasPrefix("download")).to(beTrue())
                }
                
                it("uses correct sample data") {
                    let expectedData = Data()
                    expect(target.sampleData).to(equal(expectedData))
                }
                
                it("uses correct validate") {
                    expect(target.validate) == false
                }
            }
            
            context("Thumbnail") {
                beforeEach {
                    mediaId = "mediaID"
                    server = "domain.com"
                    target = MediaAPI.thumbnail(media: mediaId, from: server, width: 100, height: 50, method: .crop)
                }
                
                /*it("uses correct baseURL") {
                 expect(target.baseURL) == URL(string: "http://example.com")!
                 }*/
                
                it("uses correct path") {
                    expect(target.path) == "/_matrix/media/r0/thumbnail/\(server!)/\(mediaId!)"
                }
                
                it("uses correct parameter encoding.") {
                    expect(target.parameterEncoding is URLEncoding) == true
                }
                
                it("uses correct parameters") {
                    expect(target.parameters?.count).to(equal(3))
                    expect(target.parameters?["width"] as? Int).to(equal(100))
                    expect(target.parameters?["height"] as? Int).to(equal(50))
                    expect(target.parameters?["method"] as? MediaMethod).to(equal(MediaMethod.crop))
                }
                
                it("uses correct method") {
                    expect(target.method) == Method.get
                }
                
                it("uses correct task") {
                    expect(String(describing: target.task).hasPrefix("download")).to(beTrue())
                }
                
                it("uses correct sample data") {
                    let expectedData = Data()
                    expect(target.sampleData).to(equal(expectedData))
                }
                
                it("uses correct validate") {
                    expect(target.validate) == false
                }
            }
            
            context("Upload") {
                beforeEach {
                    target = MediaAPI.upload(data: Data())
                }
                
                /*it("uses correct baseURL") {
                 expect(target.baseURL) == URL(string: "http://example.com")!
                 }*/
                
                it("uses correct path") {
                    expect(target.path) == "/_matrix/media/r0/upload"
                }
                
                it("uses correct parameter encoding.") {
                    expect(target.parameterEncoding is URLEncoding) == true
                }
                
                it("uses correct parameters") {
                    expect(target.parameters).to(beNil())
                }
                
                it("uses correct method") {
                    expect(target.method) == Method.post
                }
                
                it("uses correct task") {
                    expect(String(describing: target.task).hasPrefix("upload")).to(beTrue())
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
