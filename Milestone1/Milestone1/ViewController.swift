//
//  ViewController.swift
//  Milestone1
//
//  Created by Christian James Welly on 2/12/20.
//

import UIKit

class ViewController: UITableViewController {

    // MARK: Properties
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Flag Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if (item.hasSuffix("2x.png")) {
                pictures.append(item)
            }
        }
        
        print(pictures)
    }
    
    // MARK: TableView Controller
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        let flagPath = pictures[indexPath.row]
        let capitalisedFlag = Flag.capitalise(flagPath: flagPath)
        cell.textLabel?.text = capitalisedFlag
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.selectedImagePath = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

