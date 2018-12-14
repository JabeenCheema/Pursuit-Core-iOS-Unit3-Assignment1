//
//  StockPriceParser.swift
//  PeopleAndAppleStockPrices
//
//  Created by Jabeen's MacBook on 12/10/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

//class StockPriceParser { //unwrapping so we guard let
//    
//    static func getStocks() -> [StockPrice]? {
//        var stockPrices = [StockPrice]()
//        // reading a file from the App Bundle
//        guard let path = Bundle.main.path(forResource: "applstockinfo", ofType: "json") else { return nil }
//        let url = URL.init(fileURLWithPath: path)
//        // read contents of file and returns a Data object
//        if let data = try? Data.init(contentsOf:url) {
//        
//        // parse the JSON
//        do {
//           let stockArray = try JSONDecoder().decode([StockPrice].self, from: data)
//            stockPrices = stockArray.sorted(by: { (stockOne, stockTwo) -> Bool in
//                return stockOne.date < stockTwo.date
//            })
//            
//        } catch {
//            print("decoding error: \(error)")
//        }
//        
//    }
//        return stockPrices
//    }
//}
