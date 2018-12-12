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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let contactIndexpath = peopleTableView.indexPathForSelectedRow,
            let contactDetails = segue.destination as? DetailedPeopleViewController else { return }
            let contact = sortedContacts[contactIndexpath.row]
            contactDetails.personcontactDetails = contact
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        peopleTableView.dataSource = self
        searchBar.delegate = self
        loadData()
        title = "Contacts"
}
    
    func loadData() {
        if let path = Bundle.main.path(forResource: "userinfo", ofType: "json") {
            let url = URL.init(fileURLWithPath: path) // transforming json file into data; url link we can use
            if let data = try? Data.init(contentsOf: url) { // transforming url to data
            do {
                contact = try JSONDecoder().decode(UserInformation.self, from: data).results
                sortedContacts = try JSONDecoder().decode(UserInformation.self, from: data).results
                
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
        sortedContacts = sortedContacts.sorted{$0.name.fullName < $1.name.fullName}
        let cell = peopleTableView.dequeueReusableCell(withIdentifier: "PeopleCell", for: indexPath )
        let person = sortedContacts[indexPath.row]
        cell.textLabel?.text = person.name.fullName.capitalized
        cell.detailTextLabel?.text = person.location.state.capitalized
        
        return cell
    }
}

extension PeopleViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let path = Bundle.main.path(forResource: "userinfo", ofType: "json") {
            let url = URL.init(fileURLWithPath: path) // transforming json file into data; url link we can use
            if let data = try? Data.init(contentsOf: url) { // transforming url to data
                do {
                    sortedContacts = try JSONDecoder().decode(UserInformation.self, from: data).results
                    sortedContacts = sortedContacts.filter{$0.name.fullName.contains(searchText.lowercased())}
                    if searchText.isEmpty {
                    sortedContacts = try JSONDecoder().decode(UserInformation.self, from: data).results
                    }
                } catch {
                    print("error")
                }
            }
        }
    }
}
