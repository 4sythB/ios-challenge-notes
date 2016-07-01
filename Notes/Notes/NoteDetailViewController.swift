//
//  NoteDetailViewController.swift
//  Notes
//
//  Created by Brad on 7/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    private let noteKey = "keyForNote"
    
    var note: Note?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bodyTextView.layer.cornerRadius = 5
        self.automaticallyAdjustsScrollViewInsets = false
        
        if let note = note {
            updateWithNote(note)
        }
    }
    
    func updateWithNote(note: Note) {
        titleTextField.text = note.title
        bodyTextView.text = note.bodyText
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        resignFirstResponder()
        return true
    }
    
    // MARK: - IBActions
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        if let note = note, title = titleTextField.text, bodyText = bodyTextView.text where title.characters.count > 0 && bodyText.characters.count > 0 {
            NoteController.sharedController.updateNote(note, title: title, bodyText: bodyText)
            navigationController?.popViewControllerAnimated(true)
        } else if let title = titleTextField.text, bodyText = bodyTextView.text where title.characters.count > 0 && bodyText.characters.count > 0 {
            NoteController.sharedController.addNote(title, bodyText: bodyText)
            navigationController?.popViewControllerAnimated(true)
        }
        return
    }
    
    @IBAction func trashButtonTapped(sender: AnyObject) {
        
        if let note = note, title = titleTextField.text, bodyText = bodyTextView.text where title.characters.count > 0 && bodyText.characters.count > 0 {
            NoteController.sharedController.removeNote(note)
            navigationController?.popViewControllerAnimated(true)
        } else if let title = titleTextField.text, bodyText = bodyTextView.text where title.characters.count > 0 && bodyText.characters.count > 0 {
            navigationController?.popViewControllerAnimated(true)
        }
        return
    }
}









