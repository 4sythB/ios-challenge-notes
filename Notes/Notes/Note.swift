//
//  Note.swift
//  Notes
//
//  Created by Brad on 7/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Note: Equatable {
    
    private let bodyTextKey = "bodyTextKey"
    
    var bodyText: String
    
    var dictionaryCopy: [String : AnyObject] {
        let dictionary = [bodyTextKey : bodyText]
        return dictionary
    }
    
    init(bodyText: String) {
        self.bodyText = bodyText
    }
    
    init?(dictionary: [String : AnyObject]) {
        guard let bodyText = dictionary[bodyTextKey] as? String else { return nil }
        self.bodyText = bodyText
    }
}

func ==(lhs: Note, rhs: Note) -> Bool {
    return lhs.bodyText == rhs.bodyText
}
