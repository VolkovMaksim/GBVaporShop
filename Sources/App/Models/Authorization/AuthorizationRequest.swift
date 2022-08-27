//
//  AuthorizationRequest.swift
//  
//
//  Created by Maksim Volkov on 07.08.2022.
//

import Vapor

struct AuthorizationRequest: Content {
    var email: String
    var password: String
}
/*
 {
    "email": "admin@mail.ru",
    "password": "1234"
 }
 */
