//
//  StockPriceParser.swift
//  PeopleAndAppleStockPrices
//
//  Created by Jabeen's MacBook on 12/10/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

class StockPriceParser { //unwrappig so we guard let
    
    static func getStocks() -> [StockPrice]? {
        var stockPrices = [StockPrice]()
        // reading a file from the App Bundle
        guard let path = Bundle.main.path(forResource: "applstockinfo", ofType: "json") else { return nil }
        
        // read contents of file and returns a Data object
        guard let data = FileManager.default.contents(atPath: path) else { return nil }
        
        // parse the JSON
        do {
            stockPrices = try JSONDecoder().decode([StockPrice].self, from: data)
        } catch {
            print("decoding error: \(error)")
        }
        return stockPrices
    }
    
}
