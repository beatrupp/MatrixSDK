/**
 *  SessionManagementAPI.swift
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

public enum SessionManagementAPI {
    case login(type: String, password: String, username: String?, medium: String?, address: String?)
    case logout(accessToken: String)
    case refreshToken(accessToken: String, refreshToken: String)
}

extension SessionManagementAPI: SubTarget {
    public var path: String {
        switch self {
        case .login(_, _, _, _, _):
            return "/_matrix/client/r0/login"
        case .logout(let accessToken):
            return "/_matrix/client/r0/logout?access_token=\(accessToken)"
        case .refreshToken(let accessToken, _):
            return "/_matrix/client/r0/tokenrefresh?access_token=\(accessToken)"
        }
    }

    public var method: Moya.Method {
        return .post
    }

    public var parameters: [String: Any]? {
        switch self {
        case .login(let type, let password, let username, let medium, let address):
            var params = [
                "type": type,
                "password": password
            ]

            if let u = username {
                params["user"] = u
            }

            if let m = medium {
                params["medium"] = m
            }

            if let a = address {
                params["address"] = a
            }

            return params
        case .logout(_):
            return nil
        case .refreshToken(_, let refreshToken):
            return [
                "refresh_token": refreshToken
            ]
        }
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        return .request
    }

    public var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }

    public var validate: Bool {
        return false
    }
}
