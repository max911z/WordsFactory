//
//  OnboardingViewController.swift
//  WordsFactory
//
//  Created by Максим Неверовский on 16.06.2022.
//

import UIKit
import CoreData

var noteList = [Note]()
var firstNote = true


class NoteTableView: UITableViewController
{
    var firstLoad = true
    
    
    func nonDeletedNotes() -> [Note]
    {
        var noDeleteNoteList = [Note]()
        for note in noteList
        {
            if(note.deletedDate == nil)
            {
                noDeleteNoteList.append(note)
            }
        }
        return noDeleteNoteList
    }
    
    override func viewDidLoad()
    {
        if(firstLoad)
        {
            firstLoad = false
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
            do {
                let results:NSArray = try context.fetch(request) as NSArray
                if results.count == 0{
                    let entity = NSEntityDescription.entity(forEntityName: "Note", in: context)
                    let newNote = Note(entity: entity!, insertInto: context)
                    newNote.id = noteList.count as NSNumber
                    newNote.title = "First note"
                    newNote.desc = "Some words about note"
                    do
                    {
                        try context.save()
                        noteList.append(newNote)
                        navigationController?.popViewController(animated: true)
                    }
                    catch
                    {
                        print("context save error")
                    }
                }
                for result in results
                {
                    let note = result as! Note
                    noteList.append(note)
                }
            }
            catch
            {
                print("Fetch Failed")
            }
            
                        
        
        }

    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let noteCell = tableView.dequeueReusableCell(withIdentifier: "noteCellID", for: indexPath) as! NoteCell
        
        let thisNote: Note!
        thisNote = nonDeletedNotes()[indexPath.row]
        
        noteCell.titleLabel.text = thisNote.title
        noteCell.descLabel.text = thisNote.desc
        
        return noteCell
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return nonDeletedNotes().count
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.performSegue(withIdentifier: "editNote", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if(segue.identifier == "editNote")
        {
            let indexPath = tableView.indexPathForSelectedRow!
            
            let noteDetail = segue.destination as? NoteDetailVC
            
            let selectedNote : Note!
            selectedNote = nonDeletedNotes()[indexPath.row]
            noteDetail!.selectedNote = selectedNote
            
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    
}

