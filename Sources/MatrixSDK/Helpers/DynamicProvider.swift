/**
 *  DynamicProvider.swift
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
import Result

public protocol SubTarget {
    var path: String { get }
    var method: Moya.Method { get }
    var parameters: [String: Any]? { get }
    var sampleData: Data { get }
    var task: Task { get }
    var parameterEncoding: ParameterEncoding { get }
    var validate: Bool { get }
}

struct DynamicTarget: TargetType {
    let baseURL: URL
    let subTarget: SubTarget

    /// Initialize a SingleURLTarget
    init(baseUrl: URL, subTarget: SubTarget) {
        self.baseURL = baseUrl
        self.subTarget = subTarget
    }

    var path: String { return subTarget.path}
    var method: Moya.Method { return subTarget.method}
    var parameters: [String: Any]? { return subTarget.parameters }
    var sampleData: Data { return subTarget.sampleData }
    var task: Task { return subTarget.task }
    var parameterEncoding: ParameterEncoding { return subTarget.parameterEncoding }
    var validate: Bool { return subTarget.validate }
}

class DynamicProvider<Target: SubTarget>: MoyaProvider<DynamicTarget> {
    let baseUrl: URL

    public init(baseUrl: URL, endpointClosure: @escaping EndpointClosure = MoyaProvider.defaultEndpointMapping,
                requestClosure: @escaping RequestClosure = MoyaProvider.defaultRequestMapping,
                stubClosure: @escaping StubClosure = MoyaProvider.neverStub,
                plugins: [PluginType] = [],
                trackInflights: Bool = false) {
        self.baseUrl = baseUrl

        super.init(endpointClosure: endpointClosure, requestClosure: requestClosure, stubClosure: stubClosure, plugins: plugins, trackInflights: trackInflights)
    }

    // add initializer to take `baseUrl` and call super with the rest of the arguments
    func request(_ subTarget: Target, completion: @escaping ((Result<Response, MoyaError>) -> Void)) {
        let dynamicTarget = DynamicTarget(baseUrl: baseUrl, subTarget: subTarget)
        super.request(dynamicTarget, completion: completion)
    }
}
