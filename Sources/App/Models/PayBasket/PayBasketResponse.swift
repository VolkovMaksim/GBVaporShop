//
//  PayBasketResponse.swift
//  
//
//  Created by Maksim Volkov on 21.08.2022.
//

import Vapor

struct PayBasketResponse: Content {
    var cart_message: String
    var error_message: String?
}
