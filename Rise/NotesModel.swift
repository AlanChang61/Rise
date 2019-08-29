//
//  NotesModel.swift
//  Rise
//
//  Created by Alan Chang on 3/30/19.
//  Email: alangcha@usc.edu
//  Copyright © 2019 ITP342. All rights reserved.
//

import Foundation

let NOTE_DESCRIPTION_KEY = "description";


class NotesModel: NSObject, NotesDataModel {
    
    //Initalize class variables
    public var notesArray = [Note]();
    var fileName: String!;
    
    //Initialize singleton instance
    static let sharedInstance = NotesModel();
    
    //Initialize note set
    override init() {
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        fileName = "\(documentDirectory)/notes.plist";
        print("Location of document directory: \(documentDirectory)");
        
        if let notesArrayOfDictionaries = NSArray(contentsOfFile: fileName) as? [[String: String]] {
            notesArray = [];
            for noteDictionary in notesArrayOfDictionaries {
                let newNote: Note;
                newNote = Note(description: noteDictionary[NOTE_DESCRIPTION_KEY]!);
                notesArray.append(newNote);
            }
        }
        else {
            notesArray.append(Note(description: "Umbrella"));
            notesArray.append(Note(description: "Jacket"));
            notesArray.append(Note(description: "Beach Towel"));
        }
    }
    
    //Functions for FlashcardsModel Class
    //Returns number of note in the checklist
    func numberOfNotes() -> Int {
        return notesArray.count;
    }
    
    //Function to add note to the checklist
    func addNote(description: String) {
        notesArray.append(Note(description: description));
        save();
    }
    
    //Function to remove note from the checklist
    func removeNote(atIndex: Int) {
        if (numberOfNotes() > 0) {
            if (atIndex >= 0 && atIndex < notesArray.count) {
                notesArray.remove(at: atIndex);
                save();
            }
        }
    }
    
    //Function to check the box for a specific note in the checklist
    func checkBox(state: Bool, index: Int?) {
        notesArray[index!].checked = state;
        save();
    }
    
    func specificNote(atIndex: Int) -> Note? {
        if (numberOfNotes() == 0) {
            return nil;
        }
        if (atIndex >= 0 && atIndex < notesArray.count) {
            return notesArray[atIndex];
        }
        else {
            return nil;
        }
    }
    
    //Function to save to plist
    func save() {
        var notesArrayOfDictionaries = [[String: String]]();
        for note in notesArray {
            let noteDictionary = [
                NOTE_DESCRIPTION_KEY: note.getDescription(),
                ]
            notesArrayOfDictionaries.append(noteDictionary);
        }
        (notesArrayOfDictionaries as NSArray).write(toFile: fileName, atomically: true);
    }
}
