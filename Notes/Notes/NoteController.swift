//
//  NoteController.swift
//  Notes
//
//  Created by Brad on 7/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class NoteController {
    
    static let sharedController = NoteController()
    
    private let noteKey = "keyForNote"
    
    var notesArray: [Note] = []
    
    init() {
        loadFromPersistentStore()
    }
    
    // CRUD
    
    func addNote(title: String, bodyText: String) {
        let note = Note(title: title, bodyText: bodyText)
        notesArray.append(note)
        saveToPersistentStore()
    }
    
    func removeNote(note: Note) {
        if let index = notesArray.indexOf(note) {
            notesArray.removeAtIndex(index)
            saveToPersistentStore()
        }
    }
    
    func updateNote(note: Note, title: String, bodyText: String) {
        if let index = notesArray.indexOf(note) {
            notesArray[index].title = title
            notesArray[index].bodyText = bodyText
            saveToPersistentStore()
        }
    }
    
    func saveToPersistentStore() {
        NSUserDefaults.standardUserDefaults().setObject(notesArray.map({ $0.dictionaryCopy }), forKey: noteKey)
    }
    
    func loadFromPersistentStore() {
        guard let notesDictionaryArray = NSUserDefaults.standardUserDefaults().objectForKey(noteKey) as? [[String: AnyObject]] else { return }
        let notes = notesDictionaryArray.flatMap{ Note(dictionary: $0) }
        notesArray = notes
    }
}







