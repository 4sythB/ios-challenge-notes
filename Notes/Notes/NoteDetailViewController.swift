//
//  NoteDetailViewController.swift
//  Notes
//
//  Created by Brad on 7/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {
    
    private let noteKey = "keyForNote"
    
    var note: Note?
    
    @IBOutlet weak var bodyText: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let note = note {
            updateWithNote(note)
        }
    }
    
    func updateWithNote(note: Note) {
        bodyText.text = note.bodyText
    }
    
    // MARK: - IBActions
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        if let note = note, bodyText = bodyText.text where bodyText.characters.count > 0 {
            NoteController.sharedController.updateNote(note, bodyText: bodyText)
            navigationController?.popViewControllerAnimated(true)
        } else if let bodyText = bodyText.text where bodyText.characters.count > 0 {
            NoteController.sharedController.addNote(bodyText)
            navigationController?.popViewControllerAnimated(true)
        }
        return
    }
}
