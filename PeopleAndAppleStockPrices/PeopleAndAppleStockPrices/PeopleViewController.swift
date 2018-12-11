//
//  PeopleViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Jabeen's MacBook on 12/10/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController {

    var contact = [resultWrapper]()
    
    var sortedContacts = [resultWrapper](){
        didSet {
            DispatchQueue.main.async {
                self.peopleTableView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var peopleTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        peopleTableView.dataSource = self
        searchBar.delegate = self
        loadData()
}
    
    func loadData() {
        if let path = Bundle.main.path(forResource: "userinfo", ofType: "json") {
            let url = URL.init(fileURLWithPath: path) // transforming json file into data; url link we can use
            if let data = try? Data.init(contentsOf: url) { // transforming url to data
            do {
                let dictionary = try JSONDecoder().decode(UserInformation.self, from: data)
                contact = dictionary.results
                sortedContacts = contact.sorted(by: {$0.name.last < $1.name.last})
                
            } catch {
                print("error")
                }
            }
        }
    }
}
extension PeopleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedContacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = peopleTableView.dequeueReusableCell(withIdentifier: "PeopleCell", for: indexPath )
        let person = sortedContacts[indexPath.row]
        cell.textLabel?.text = person.name.fullName
        cell.detailTextLabel?.text = person.location.state.capitalized
        
        return cell
    }
}

extension PeopleViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
         searchBar.resignFirstResponder()
        guard let searchName = searchBar.text else { return }
        sortedContacts = sortedContacts.filter { $0.name.fullName.contains(searchName)
            
            
        }
        
    }
}
