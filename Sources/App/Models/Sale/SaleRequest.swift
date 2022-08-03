//
//  SaleRequest.swift
//  
//
//  Created by Maksim Volkov on 03.08.2022.
//

import Vapor

struct SaleRequest: Content {
    var id_user: Int
    var item: String
    var size: Int
    var quantity: Int
    var price: Double
    var credit_card: String
}

//add github
/*
 {
     "id_user": 123,
     "item": "Шаровары",
     "size": 56,
     "quantity": 2,
     "price": 1005.2,
     "credit_card": "9321-8432-7543-6321"
 }
 */
