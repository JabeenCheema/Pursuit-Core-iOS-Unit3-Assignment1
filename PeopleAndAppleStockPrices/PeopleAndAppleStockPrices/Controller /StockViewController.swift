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
    var stocksByYear = [[StockPrice]]()
    var stockMonth = [[StockPrice]]()
    
    var sectionNames = [String]()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let detailedViewController = segue.destination as? StocksDetailedViewController,
                let cellSelected = stocksTableView.indexPathForSelectedRow else { return }
        let sectionStocks = self.stocksBySection(section: cellSelected.section)
        let thisStock = sectionStocks[cellSelected.row]
        detailedViewController.perstockDetails = thisStock
       


        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let prices = StockPriceParser.getStocks() {
//            stockPrices = prices
//            print("there are \(stockPrices.count) prices")
//        }
        stocksTableView.dataSource = self
        stocksTableView.delegate = self
        title = "Stocks"
        
        loadData()
        getSectionNames()
    }
    
    func getSectionNames() {
        for stock in stockPrices {
            if !sectionNames.contains(stock.sectionName) { // if the section name does not have the section then add that section
                sectionNames.append(stock.sectionName)
            }
        }
    }
    
    func stocksBySection(section: Int) -> [StockPrice] {
        return stockPrices.filter ({$0.sectionName == sectionNames[section]})
    }
    
    func yearAndMonth(){
        for yearNum in 2016...2018 {
            
            let yearStock = stockPrices.filter{(stock) -> Bool in
                
                let dateSeparated = stock.date.components(separatedBy: "-")
                let currentStockYear = dateSeparated[0]
                
                if Int(currentStockYear) == yearNum {
                    return true
                } else {
                    return false
                }
            }
        stocksByYear.append(yearStock)
}

        
        for arrYearStocks in stocksByYear {
            for monthNum in 1...12 {
                let stockMonthArr = arrYearStocks.filter { (stock) -> Bool in
                    let dateSeparated = stock.date.components(separatedBy: "-")
                    let currentStockMonth = dateSeparated[1]
                    
                    if Int(currentStockMonth) == monthNum  {
                        return true
                    } else {
                        return false
                    }
                }
            
                if !stockMonthArr.isEmpty {
                    stockMonth.append(stockMonthArr)
                }
            }
    }
}
    
    
    func loadData() {
        if let path = Bundle.main.path(forResource: "applstockinfo", ofType: "json") {
            let url = URL.init(fileURLWithPath: path)
            if let data = try? Data.init(contentsOf: url) {
                do {
                    let stocksArray = try JSONDecoder().decode([StockPrice].self, from: data)
                    stockPrices = stocksArray.sorted(by: { (stockOne, stockTwo) -> Bool in
                        return stockOne.date < stockTwo.date
                    })
                } catch {
                    print(error)
                }
            }
        }
    }
}


extension StockViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionNames.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let thisSection = sectionNames[section]
        let stocksInThissection = stockPrices.filter({$0.sectionName == thisSection})
        var sum = 0.0
        for stock in stocksInThissection {
            sum += stock.open
        }
        let average = sum / Double(stocksInThissection.count)
        return sectionNames[section] + "     " + "Average \(String(format: "%.2f",average))"
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocksBySection(section: section).count // this will determine your sections
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StockPriceCell", for: indexPath)
        let stocksinthissection = stocksBySection(section: indexPath.section)
        let stock = stocksinthissection[indexPath.row]
        cell.textLabel?.text = stock.date
        cell.detailTextLabel?.text = "\(stock.open)"
        cell.detailTextLabel?.text = "$" + String(format: "%.2f", stock.open)
        return cell
    }
}

