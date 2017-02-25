/**
 *  MXCredentials.swift
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

/// Represents the response to a login or a register request
public struct MXCredentials: Mappable {
    // MARK: Properties
    
    /// An access token for the account.
    /// This access token can then be used to authorize other requests.
    public private(set) var accessToken: String!
    
    /// The hostname of the homeserver on which the account has been registered.
    public private(set) var homeserver: String?
    
    /// A refresh_token may be exchanged for a new access_token using the /tokenrefresh API endpoint.
    public private(set) var refreshToken: String?
    
    /// The fully-qualified Matrix ID that has been registered.
    public private(set) var userId: String?
    
    /// The device id.
    public private(set) var deviceId: String?
    
    // MARK: Mappable
    
    public init?(map: Map) {
        if map.JSON["access_token"] == nil {
            return nil
        }
    }
    
    public mutating func mapping(map: Map) {
        accessToken <- map["access_token"]
        homeserver <- map["home_server"]
        refreshToken <- map["refresh_token"]
        userId <- map["user_id"]
        deviceId <- map["device_id"]
    }
}
