//
//  SaleResponse.swift
//  
//
//  Created by Maksim Volkov on 03.08.2022.
//

import Vapor

struct SaleResponse: Content {
    var result: Int
    var bank_message: String
    var error_message: String?
}
