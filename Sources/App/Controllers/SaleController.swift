//
//  SaleController.swift
//  
//
//  Created by Maksim Volkov on 03.08.2022.
//

import Vapor

class SaleController {
    func sale(_ req: Request) throws -> EventLoopFuture<SaleResponse> {
        guard let body = try? req.content.decode(SaleRequest.self) else {
            throw Abort(.badRequest)
            
        }

        print(body)

        let response = SaleResponse(
            result: 1,
            bank_message: "Оплата проведена успешно!",
            error_message: nil
        )

        return req.eventLoop.future(response)
    }
}
