/**
 *  TestProvider.swift
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
import Moya

class TestProvider<Target: TargetType>: MoyaProvider<Target> {
    init(responseClosure: ((Target) -> EndpointSampleResponse)? = nil) {
        var endpointClosure: EndpointClosure
        
        if let responseClosure = responseClosure {
            endpointClosure = {
                target in
                
                let sampleResponseClosure: Endpoint<Target>.SampleResponseClosure = {
                    return responseClosure(target)
                }
                
                return Endpoint(
                    url: target.baseURL.absoluteString,
                    sampleResponseClosure: sampleResponseClosure,
                    method: target.method,
                    parameters: target.parameters,
                    parameterEncoding: target.parameterEncoding,
                    httpHeaderFields: nil
                )
            }
        } else {
            endpointClosure = MoyaProvider<Target>.defaultEndpointMapping
        }
        
        super.init(endpointClosure: endpointClosure, stubClosure: MoyaProvider.immediatelyStub, plugins: [])
    }
}
