//
//  StockPrice.swift
//  PeopleAndAppleStockPrices
//
//  Created by Jabeen's MacBook on 12/10/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

struct StockPrice: Codable {
    let date: String
    let open: Double
    let high: Double
    let low: Double
    let close: Double
    let volume: Int
    let unadjustedVolume: Int
    let change: Double
    let changePercent: Double
    let vwap: Double
    let label: String
    let changeOverTime: Double
}
