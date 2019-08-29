//
//  AddNoteViewController.swift
//  Rise
//
//  Created by Alan Chang on 3/30/19.
//  Email: alangcha@usc.edu
//  Copyright © 2019 ITP342. All rights reserved.
//

import UIKit

class AddNoteViewController: UIViewController {

    //Declare outlets for add note view controller
    @IBOutlet weak var noteTextField: UITextField!
    
    //Dismiss view controller when cancel button is pressed
    @IBAction func cancelButtonDidPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil);
    }
    
    //Adds a note when addButton is pressed
    @IBAction func addButtonDidPressed(_ sender: UIButton) {
        if noteTextField.text != "" {
            NotesModel.sharedInstance.addNote(description: noteTextField.text!);
            self.dismiss(animated: true, completion: nil);
        }
    }
    
    //View did load for add note view controller
    override func viewDidLoad() {
        super.viewDidLoad();
        noteTextField.becomeFirstResponder();
    }
}
