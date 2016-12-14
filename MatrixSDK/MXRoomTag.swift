//
//  MXRoomTag.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 12/13/16.
//  Copyright © 2016 Gustavo Perdomo. All rights reserved.
//

import Foundation
import ObjectMapper

/// Represents a room tag.
class MXRoomTag {
    // MARK: Properties
    
    /// The name of a tag.
    private(set) var name: String
    
    /// An optional information to order the room within a list of rooms with the same tag name.
    /// If not nil, the `order` string is used to make lexicographically by unicode codepoint comparison.
    private(set) var order: UInt?
    
    /// Basic constructor.
    ///
    /// - Parameter name: name of the tag
    /// - Parameter order: order of the tag
    /// - Returns: a RoomTag
    init(name: String, order: UInt?) {
        self.name = name
        self.order = order
    }
    
    /// Extract a list of tags from a room tag event.
    ///
    /// - Parameter event: event
    /// - Returns: a dictionary containing the tags the user defined for one room. The key is the tag name. The value, the associated MXRoomTag object.
    static func roomTagsWithTagEvent(event: MXEvent) -> Dictionary<String, MXRoomTag> {
        var tags: Dictionary<String, MXRoomTag> = [:]
        
        if let eventTags = event.content["tags"] as? Dictionary<String, Any> {
            
            for (name, tag) in eventTags {
                var order: UInt?
                
                if let tagDict = tag as? Dictionary<String, Any> {
                    if let _order = tagDict["order"] as? Int {
                        order = UInt(_order)
                    }
                }
                
                tags[name] =  MXRoomTag(name: name, order: order)
            }
        }
        
        return tags
    }
}
