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
        // Do any additional setup after loading the view.
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

}

