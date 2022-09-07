//
//  MerchRequest.swift
//  
//
//  Created by Maksim Volkov on 04.09.2022.
//

import Vapor

struct MerchRequest: Content {
    // передаем название товара
    var merchname: String
}

