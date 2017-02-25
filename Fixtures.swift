/**
 *  Fixtures.swift
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
import SwifterSwift
import ObjectMapper
import MatrixSDK

func fixtureData(_ responseType: Mappable.Type, parameters: [String: Any]? = nil) -> Data {
    return fixture(responseType, parameters: parameters).jsonData() ?? Data()
}

func fixture(_ responseType: Mappable.Type, parameters: [String: Any]? = nil) -> [String: Any] {
    switch responseType {
    case is MXCredentials.Type:
        return Fixtures.buildMXCredentials(parameters)
        
    case is MXError.Type:
        return Fixtures.buildMXError(parameters)

    default:
        return [:]
    }
}

struct Fixtures {
    static func buildMXError(_ parameters: [String: Any]? = [:]) -> [String: Any] {
        return [
            "errcode": parameters?["code"] ?? MXErrorCode.unknown,
            "error": parameters?["error"] ?? ""
        ]
    }
    
    static func buildMXCredentials(_ parameters: [String: Any]? = [:]) -> [String: Any] {
        let user = parameters?["user"] ?? "user"
        let server = parameters?["server"] ?? "matrix.org"
        
        return [
            "access_token": "ACCESS_TOKEN",
            "home_server": "matrix.org",
            "user_id": "@\(user):\(server)",
            "refresh_token": "REFRESH_TOKEN",
            "device_id": "DEVICE_ID"
        ]
    }
}
