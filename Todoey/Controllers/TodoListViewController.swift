//
//  ViewController.swift
//  Todoey
//
//  Created by Mihai Bratasanu on 1/3/19.
//  Copyright © 2019 Mihai Bratasanu. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       let newItem = Item()
        newItem.title = "Buy Milk"
        itemArray.append(newItem)
      
        let newItem2 = Item()
        newItem2.title = "Buy Cola"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Do Good"
        itemArray.append(newItem3)
    
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {

            itemArray = items
        }

    }
    
   var itemArray = [Item]()
    
    
    let defaults = UserDefaults.standard

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        let item = itemArray[indexPath.row]
        
        if item.done == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in

            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
}

