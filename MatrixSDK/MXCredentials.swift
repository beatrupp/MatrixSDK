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
    
    /// The home server name
    var homeserver: String!
    
    /// The obtained user id.
    var userId: String!
    
    /// The access token to create a MXRestClient
    var accessToken: String!
    
    /// The refresh token to create a MXRestClient
    var refreshToken: String!
    
    /// The device id.
    var deviceId: String!
    
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
