//
//  NotesDataModel.swift
//  Rise
//
//  Created by Alan Chang on 3/30/19.
//  Email: alangcha@usc.edu
//  Copyright © 2019 ITP342. All rights reserved.
//

import Foundation

//Protocol with list of functions that NotesDataModel must implement
protocol NotesDataModel {
    func numberOfNotes() -> Int
    func addNote(description: String)
    func checkBox(state: Bool, index: Int?)
    func removeNote(atIndex: Int)
    func specificNote(atIndex: Int) -> Note?
}
