//
//  AddToCartResponse.swift
//  
//
//  Created by Maksim Volkov on 19.08.2022.
//

import Vapor

struct AddToCartResponse: Content {
    var result: Int
    var cart_message: String
    var error_message: String?
}
