//
//  ViewController.swift
//  adk46er
//
//  Created by Eric Langdon on 3/22/20.
//  Copyright © 2020 Eric Langdon. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var itemStore : HikeItemStore!

    //Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 75
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showItem"?:
            if let row = tableView.indexPathForSelectedRow?.row {
                let item = itemStore.allItems[row]
                let detailVC = segue.destination as! DetailViewController
                detailVC.item = item
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    override func tableView(_ tableView : UITableView, numberOfRowsInSection section : Int) -> Int {
        return itemStore.allItems.count
    }
    
    //Cell
    override func tableView(_ tableView : UITableView, cellForRowAt indexPath : IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HikeItemCell", for : indexPath) as! HikeItemCell
        let item = itemStore.allItems[indexPath.row]
        
        cell.nameLabel.text = item.name
        cell.serNumLabel.text = item.serialNum
        cell.valueLabel.text = "$\(item.valDollars)"
        
        return cell
    }
    
    //Remove Cell
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = itemStore.allItems[indexPath.row]
            
            let title = "Remove \(item.name)?"
            let message = "Are you sure you want to delete this item?"
            
            let action = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            action.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Remove", style: .destructive, handler: {
                (action) -> Void in
                self.itemStore.removeItem(item)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                
            })
            action.addAction(deleteAction)
            
            present(action, animated: true, completion: nil)
        }
    }
    
    //Move Cell
    override func tableView(_ tableView: UITableView,
                            moveRowAt sourceIndexPath: IndexPath,
                            to destinationIndexPath : IndexPath) {
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    //IBAction Buttons
    @IBAction func addNewItem(_ sender : UIButton) {
        
        let newItem = itemStore.createItem()
        
        if let idx = itemStore.allItems.firstIndex(of: newItem) {
            let indexPath = IndexPath(row: idx, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func toggleEditMode(_ sender : UIButton) {
        if isEditing {
            sender.setTitle("Edit", for: .normal)
            setEditing(false, animated: true)
        } else {
            sender.setTitle("Done", for: .normal)
            setEditing(true, animated: true)
        }
    }
    
}

