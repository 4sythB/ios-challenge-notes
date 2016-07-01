//
//  Note.swift
//  Notes
//
//  Created by Brad on 7/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Note: Equatable {
    
    private let titleKey = "titleKey"
    private let bodyTextKey = "bodyTextKey"
    
    var title: String
    var bodyText: String
    
    var dictionaryCopy: [String : AnyObject] {
        let dictionary = [titleKey : title, bodyTextKey : bodyText]
        return dictionary
    }
    
    init(title: String, bodyText: String) {
        self.title = title
        self.bodyText = bodyText
    }
    
    init?(dictionary: [String : AnyObject]) {
        guard let title = dictionary[titleKey] as? String, bodyText = dictionary[bodyTextKey] as? String else { return nil }
        self.title = title
        self.bodyText = bodyText
    }
}

func ==(lhs: Note, rhs: Note) -> Bool {
    return lhs.title == rhs.title && lhs.bodyText == rhs.bodyText
}
