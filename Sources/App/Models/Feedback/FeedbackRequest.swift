//
//  FeedbackRequest.swift
//  
//
//  Created by Maksim Volkov on 03.09.2022.
//

import Vapor

struct FeedbackRequest: Content {
    var item: String
    var feedback: String
}
