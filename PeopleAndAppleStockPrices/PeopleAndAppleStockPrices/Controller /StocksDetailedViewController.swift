//
//  StocksDetailedViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Jabeen's MacBook on 12/11/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class StocksDetailedViewController: UIViewController {

    var perstockDetails: StockPrice!
    
    @IBOutlet weak var stocksDate: UILabel!
    
    @IBOutlet weak var stocksImage: UIImageView!
    
    @IBOutlet weak var stocksOpen: UILabel!
    
    @IBOutlet weak var stocksClose: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stocksDate.text = perstockDetails.date
        stocksOpen.text = "\(perstockDetails.open)"
        stocksClose.text = "\(perstockDetails.close)"
        if perstockDetails.close > perstockDetails.open {
            view.backgroundColor = .green
            stocksImage.image = UIImage.init(named: "thumbsUp")
        } else {
            view.backgroundColor = .red
            stocksImage.image = UIImage.init(named: "thumbsDown")
        }
       
    }
    

   

}
