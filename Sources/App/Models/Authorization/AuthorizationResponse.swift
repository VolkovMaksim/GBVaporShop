//
//  AuthorizationResponse.swift
//  
//
//  Created by Maksim Volkov on 07.08.2022.
//

import Vapor

struct AuthorizationResponse: Content {
    var username: String?
    var email: String?
    var password: String?
    var credit_card: String?
    var itemsInCart: Int?
    var result: Int
    var user_message: String
    var error_message: String?
}
