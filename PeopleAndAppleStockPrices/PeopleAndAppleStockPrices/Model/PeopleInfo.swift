//
//  PeopleInfo.swift
//  PeopleAndAppleStockPrices
//
//  Created by Jabeen's MacBook on 12/10/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

struct UserInformation: Codable {
    let results: [resultWrapper]
}

struct resultWrapper: Codable {
    let gender: String
    let name: nameWrapper
    let location: locationWrapper
    let email: String
    let picture: pictureWrapper
}

struct nameWrapper: Codable {
    let title: String
    let first: String
    let last: String
    
    public var fullName: String {     // before this i only had the first name showing, if i code this in the model I don't need to do it in the view controller and detailed view controller 
        return first + " " + last
    }
}

struct locationWrapper: Codable {
    let street: String
    let city: String
    let state: String
    let postcode: String
}

struct pictureWrapper: Codable {
    let large: URL
    let medium: URL
    let thumbnail: URL
}

