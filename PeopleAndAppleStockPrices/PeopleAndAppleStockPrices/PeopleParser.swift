//
//  PeopleParser.swift
//  PeopleAndAppleStockPrices
//
//  Created by Jabeen's MacBook on 12/11/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

//class UserInformationParser {
//
//static func loadData() {
//    if let path = Bundle.main.path(forResource: "userinfo", ofType: "json") {
//        let url = URL.init(fileURLWithPath: path) // transforming json file into data; url link we can use
//        if let data = try? Data.init(contentsOf: url) { // transforming url to data
//            do {
//                let dictionary = try JSONDecoder().decode(UserInformation.self, from: data)
//                contact = dictionary.results
//                sortedContacts = contact.sorted(by: {$0.name.last < $1.name.last})
//
//            } catch {
//                print("error")
//            }
//        }
//    }
//}
//}
