//
//  MerchResponse.swift
//  
//
//  Created by Maksim Volkov on 04.09.2022.
//

import Vapor

struct MerchResponse: Content {
    // возвращаем цену и отзывы о товаре
    var priceInMerchResponse: Int
    var feedbackInMerchResponse: [String]
}
