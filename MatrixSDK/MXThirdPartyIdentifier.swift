//
//  MXThirdPartyIdentifier.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 12/13/16.
//  Copyright © 2016 Gustavo Perdomo. All rights reserved.
//

import Foundation
import ObjectMapper

typealias MX3PIDMedium = String

/// Represents the response to /account/3pid GET request.
class MXThirdPartyIdentifier: Mappable {
    // MARK: Properties
    
    /// The medium of the third party identifier.
    private(set) var medium: MX3PIDMedium!

    /// The third party identifier address.
    private(set) var address: String?

    /// The timestamp in milliseconds when this 3PID has been validated.
    private(set) var validatedAt: UInt64?

    /// The timestamp in milliseconds when this 3PID has been added to the user account.
    private(set) var addedAt: UInt64?

    // MARK: Mappable
    required init?(map: Map) {
        if map.JSON["medium"] == nil {
            return nil
        }
    }

    func mapping(map: Map) {
        medium <- map["medium"]
        address <- map["address"]
        validatedAt <- map["validated_at"]
        addedAt <- map["added_at"]
    }
}
