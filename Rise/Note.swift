//
//  Note.swift
//  Rise
//
//  Created by Alan Chang on 3/30/19.
//  Email: alangcha@usc.edu
//  Copyright © 2019 ITP342. All rights reserved.
//

import Foundation

//Notes Class declaration
class Note {
    private(set) var description: String = "";
    public var checked: Bool;
    
    //Constructor for Note Class
    init (description: String) {
        self.description = description;
        self.checked = false;
    }
    
    //Getter for description variable
    func getDescription() -> String {
        return description;
    }
}
