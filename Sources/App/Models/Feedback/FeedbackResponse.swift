//
//  FeedbackResponse.swift
//  
//
//  Created by Maksim Volkov on 03.09.2022.
//

import Vapor

struct FeedbackResponse: Content {
    var merch_message: String
    var error_message: String?
}
