//
//  ViewController.swift
//  Milestone2
//
//  Created by Christian James Welly on 4/12/20.
//

import UIKit

class ViewController: UITableViewController {

    // MARK: Properties
    var shoppingList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Shopping List"
        
        // Creating BarButtonItems
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        let clearButton = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(clearShoppingList))
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareShoppingList))
        
        // Setting the BarButtonItems
        navigationItem.rightBarButtonItems = [addButton, shareButton]
        navigationItem.leftBarButtonItem = clearButton
        
    }

    // MARK: TableView Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }
    
    // MARK: BarButtonItem Methods
    @objc func addItem() {
        let ac = UIAlertController(title: "Add new item", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) {
            [weak self, weak ac] _ in
            guard let item = ac?.textFields?[0].text else { return }
            self?.submit(item)
        }
        
        ac.addAction(submitAction)
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(ac, animated: true)
    }
    
    func submit(_ item: String) {
        shoppingList.insert(item, at: 0)
        
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }

    @objc func clearShoppingList() {
        let ac = UIAlertController(title: "Are you sure?", message: "This will clear your list. It cannot be undone.", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) {
            [weak self] _ in
            self?.shoppingList.removeAll()
            self?.tableView.reloadData()
        }
        
        ac.addAction(confirmAction)
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(ac, animated: true)
    }
    
    @objc func shareShoppingList() {
        let joinedShoppingList = shoppingList.joined(separator: "\n")
        let vc = UIActivityViewController(activityItems: [joinedShoppingList], applicationActivities: [])
        
        // Hardcoded because the project is still pretty small. Ideally the index is shared
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItems?[1]
        
        present(vc, animated: true)
    }
}

