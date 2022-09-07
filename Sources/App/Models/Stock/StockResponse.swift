//
//  StockResponse.swift
//  
//
//  Created by Maksim Volkov on 03.09.2022.
//

import Vapor

struct StockResponse: Content {
    var merchAndPriceInStockResponse: [String: Int]
    var error_message: String?
}

