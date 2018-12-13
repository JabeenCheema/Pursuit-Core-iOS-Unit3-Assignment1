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
       
    }
    

   

}
