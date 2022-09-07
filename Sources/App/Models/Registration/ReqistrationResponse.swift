//
//  ReqistrationResponse.swift
//  
//
//  Created by Maksim Volkov on 05.08.2022.
//

import Vapor

struct ReqistrationResponse: Content {
    var result: Int
    var user_message: String?
    var error_message: String?
}
