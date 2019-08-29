//
//  NotesDataModel.swift
//  Rise
//
//  Created by Student on 4/3/19.
//  Copyright © 2019 ITP342. All rights reserved.
//

import Foundation

//Protocol with list of functions that NotesDataModel must implement
protocol NotesDataModel {
    func numberOfNotes() -> Int
    func addNote(name: String)
    func checkBox(state: Bool, index: Int?)
    func removeNote(atIndex: Int)
}
