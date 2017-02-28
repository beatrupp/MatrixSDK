/**
 *  MXError.swift
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
import ObjectMapper

public enum MXErrorCode: String, RawRepresentable {
    case unknown = "M_UNKNOWN"
    case forbidden = "M_FORBIDDEN"
    case unknownToken = "M_UNKNOWN_TOKEN"
    case badJSON = "M_BAD_JSON"
    case notJSON = "M_NOT_JSON"
    case notFOUND = "M_NOT_FOUND"
    case limitExceeded = "M_LIMIT_EXCEEDED"
    case userInUSE = "M_USER_IN_USE"
    case invalidUsername = "M_INVALID_USERNAME"
    case roomInUse = "M_ROOM_IN_USE"
    case badPagination = "M_BAD_PAGINATION"

    case threePidInUse = "M_THREEPID_IN_USE"
    case threePidNotFound = "M_THREEPID_NOT_FOUND"
    case serverNotTrusted = "M_SERVER_NOT_TRUSTED"
}

/// Represents a Error response
public struct MXError: Mappable, Error {
    // MARK: Properties

    /// The error code
    public private(set) var code: MXErrorCode!

    /// The error message
    public private(set) var error: String?

    public init(code: String, error: String? = nil) {
        self.code = MXErrorCode(rawValue: code)
        self.error = error
    }

    public init(code: MXErrorCode, error: String? = nil) {
        self.code = code
        self.error = error
    }

    // MARK: Mappable

    public init?(map: Map) {
        if map.JSON["errcode"] == nil {
            return nil
        }
    }

    public mutating func mapping(map: Map) {
        code <- map["errcode"]
        error <- map["error"]
    }

    public var description: String {
        return "\(code) - \(error)"
    }
}
