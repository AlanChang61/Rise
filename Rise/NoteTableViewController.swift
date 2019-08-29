//
//  NoteTableViewController.swift
//  Rise
//
//  Created by Alan Chang on 3/30/19.
//  Email: alangcha@usc.edu
//  Copyright © 2019 ITP342. All rights reserved.
//

import UIKit

class NoteTableViewController: UITableViewController {
    
    //Declare outlets needed for table view controller
    @IBOutlet weak var checkBoxOutlet: UIButton!
    @IBOutlet weak var noteDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
     //Reloads table data
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData();
    }
    
    //Initializes number of sections in table
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Initializes number of rows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NotesModel.sharedInstance.notesArray.count;
    }
    
    //Assigns data to cells in table
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        cell.textLabel?.text = NotesModel.sharedInstance.notesArray[indexPath.row].description;
        return cell;
    }
    
    //Allows to delete from the table
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //Calls remove note function
            NotesModel.sharedInstance.removeNote(atIndex: indexPath.row);
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
