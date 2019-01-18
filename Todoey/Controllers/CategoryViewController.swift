//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Mihai Bratasanu on 1/10/19.
//  Copyright © 2019 Mihai Bratasanu. All rights reserved.
//

import UIKit
import RealmSwift


class CategoryViewController: UITableViewController {

    let realm = try! Realm()
    
    var categories: Results<Category>?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       loadCategories()
    
    }
    
    //Mark: - TableView Datasource Methods
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
        // if categories is not nil return count, if not, return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No categories added yet."
        
//        let item = itemArray[indexPath.row]
        
        if (categories?[indexPath.row].items.count)! > 0 {
            cell.accessoryType = .disclosureIndicator
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    //Mark: - Data Manipulation Methods
    
    func save(category: Category) {
        
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print(error)
        }
        
        self.tableView.reloadData()
    }
    
    func loadCategories() {
        
        categories = realm.objects(Category.self)
        
        self.tableView.reloadData()
    }
    
    //Mark: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        categories.remove(at: indexPath.row)
//        saveCategories()
//        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "goToItems", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let destinationVC = segue.destination as! TodoListViewController

        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
    
        }
    }
    
    //Mark: - Add New Categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            
            let newCategory = Category()
            newCategory.name = textField.text!
            
            self.save(category: newCategory)
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new Category"
            textField = alertTextField
            
        }
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
 
    

}
