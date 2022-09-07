//
//  MerchController.swift
//  
//
//  Created by Maksim Volkov on 04.09.2022.
//

import Vapor

class MerchController {
    var stock = Stock()
    func merch(_ req: Request) throws -> EventLoopFuture<MerchResponse> {
        guard let body = try? req.content.decode(MerchRequest.self) else {
            throw Abort(.badRequest)
        }

        print(body)

        let response = MerchResponse(
            priceInMerchResponse: stock.merchAndPriceInStock[body.merchname]!,
            feedbackInMerchResponse: stock.merchAndFeedbackInStock[body.merchname]!
        )

        return req.eventLoop.future(response)
    }
}
