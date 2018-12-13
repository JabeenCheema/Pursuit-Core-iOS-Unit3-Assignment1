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
    var stockYear = [""]
    var stockMonth = [""]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let destination = segue.destination as? StocksDetailedViewController,
                let cellSelected = stocksTableView.indexPathForSelectedRow else { return }
        let userSelected = stockPrices[cellSelected.row]
        destination.perstockDetails = userSelected
//        guard let stockIndexpath = stocksTableView.indexPathForSelectedRow,
//        let stockdetails = segue.destination as? StocksDetailedViewController else { return }
//        let stockPrice = stockdetails[stockIndexpath.row]
//        stockPr = stockPrice

        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stocksTableView.dataSource = self
        title = "Stocks"
        
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "StockPriceCell", for: indexPath)
        let stock = stockPrices[indexPath.row]
        cell.textLabel?.text = stock.date
        cell.detailTextLabel?.text = "\(stock.open)"
        
        
        return cell
    }
}
