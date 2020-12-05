//
//  ViewController.swift
//  Project7
//
//  Created by Christian James Welly on 4/12/20.
//

import UIKit

class ViewController: UITableViewController {
    
    // MARK: Properties
    var petitions = [Petition]()
    var filteredPetitions = [Petition]()
    var filtered = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString: String
        
        print("didLoad")
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        
        configureNavBar()
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                // We're OK to parse
                parse(json:data)
                return
                
            }
        }
        
        showError()
    }
    
    func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Ok", style: .default))
        present(ac, animated: true)
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            tableView.reloadData()
        }
    }
    
    // MARK: Navbar methods
    func configureNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Credits", style: .plain, target: self, action: #selector(showCredits))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(filter))
    }
    
    @objc func showCredits() {
        let ac = UIAlertController(title: "Credits", message: "The information provided here is from the We The People API of the Whitehouse", preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Close", style: .default)
        ac.addAction(closeAction)
        
        present(ac, animated: true)
    }
    
    @objc func filter() {
        let ac = UIAlertController(title: "Enter filter keyword", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) {
            [weak self, weak ac] _ in
            guard let filterKeyword = ac?.textFields?[0].text else { return }
            self?.submit(filterKeyword)
        }
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit(_ filterKeyword: String) {
        for petition in petitions {
            let title = petition.title
            let body = petition.body
            
            if (title.contains(filterKeyword) || body.contains(filterKeyword)) {
                filteredPetitions.append(petition)
            }
        }
        
        filtered = true
        tableView.reloadData()
    }
    
    // MARK: TableView Methods
    func getCurrPetitions() -> [Petition] {
        if (filtered) {
            return filteredPetitions
        } else {
            return petitions
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currPetitions = getCurrPetitions()
        return currPetitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currPetitions = getCurrPetitions()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = currPetitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currPetitions = getCurrPetitions()
        let vc = DetailViewController()
        vc.detailItem = currPetitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

