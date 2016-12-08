//
//  MXCredentials.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 12/06/16.
//  Copyright © 2016 Gustavo Perdomo. All rights reserved.
//

import Foundation
import ObjectMapper

/// Represents the response to a login or a register request
class MXCredentials: Mappable {
    // MARK: Properties
    
    /// The home server name
    private(set) var homeserver: String!
    
    /// The obtained user id.
    private(set) var userId: String!
    
    /// The access token to create a MXRestClient
    private(set) var accessToken: String!
    
    /// The refresh token to create a MXRestClient
    private(set) var refreshToken: String!
    
    /// The device id.
    private(set) var deviceId: String!
    
    /// The server certificate trusted by the user (nil when the server is trusted by the device).
    private(set) var allowedCertificate: Data?
    
    /// The ignored server certificate (set when the user ignores a certificate change).
    private(set) var ignoredCertificate: Data?
    
    /// Simple MXCredentials construtor
    ///
    /// - Parameters:
    ///   - homeserver: homeserver url
    ///   - user: <#user description#>
    ///   - aToken: <#aToken description#>
    ///   - rToken: <#rToken description#>
    ///   - device: <#device description#>
    init(homeserver: String, userId: String, accessToken: String, refreshToken: String, deviceId: String) {
        self.homeserver = homeserver
        self.userId = userId
        self.accessToken = accessToken
        self.refreshToken = refreshToken
        self.deviceId = deviceId
    }
    
    // MARK: Mappable
    required init?(map: Map) {
        if map.JSON["user_id"] == nil, map.JSON["access_token"] == nil {
            return nil
        }
    }
    
    func mapping(map: Map) {
        homeserver <- map["home_server"]
        userId <- map["user_id"]
        accessToken <- map["access_token"]
        refreshToken <- map["refresh_token"]
        deviceId <- map["device_id"]
    }
}
