//
//  EditPersonalDataResponse.swift
//  
//
//  Created by Maksim Volkov on 16.08.2022.
//

import Vapor

struct EditPersonalDataResponse: Content {
    var result: Int
    var user_message: String
    var error_message: String?
}
