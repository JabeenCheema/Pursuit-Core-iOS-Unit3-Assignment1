//
//  ViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Alex Paul on 12/7/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class StockViewController: UIViewController {
    
   
    @IBOutlet weak var stocksTableView: UITableView!
    
    // needs to be a 2d array
    private var stockPrices = [StockPrice]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stocksTableView.dataSource = self 
        
        
        if let prices = StockPriceParser.getStocks() {
            stockPrices = prices
            print("there are \(stockPrices.count) prices")
        }
        
    }
}

extension StockViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockPrices.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleCell", for: indexPath)
        return cell
    }
}
