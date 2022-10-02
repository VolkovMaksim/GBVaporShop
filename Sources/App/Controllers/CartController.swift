//
//  CartController.swift
//  
//
//  Created by Maksim Volkov on 19.08.2022.
//

import Vapor

class CartController {
    let stok = Stock()
    var merchInCartArray = [String: Int]()
    var message = ""
    
    func addToCart(_ req: Request) throws -> EventLoopFuture<AddToCartResponse> {
        guard let body = try? req.content.decode(AddToCartRequest.self) else {
            throw Abort(.badRequest)
            
        }

        print(body)
        merchInCartArray[body.merchname] = stok.merchAndPriceInStock[body.merchname]

        message = "Товар \(body.merchname) добавлен в корзину"
        let response = AddToCartResponse(
            result: 1,
            cart_message: message,
            error_message: nil
        )

        return req.eventLoop.future(response)
    }
    
    func removeFromCart(_ req: Request) throws -> EventLoopFuture<AddToCartResponse> {
        guard let body = try? req.content.decode(AddToCartRequest.self) else {
            throw Abort(.badRequest)
        }

        print(body)
        
        let removedMerch = merchInCartArray.removeValue(forKey: body.merchname)
        //print(removedMerch)
        if removedMerch != nil {
            message = "Товар \(body.merchname) удален из корзины"
        } else {
            message = "Такого товара нет в корзине"
        }

        let response = AddToCartResponse(
            result: 1,
            cart_message: message,
            error_message: nil
        )

        return req.eventLoop.future(response)
    }
    
    // списание средств за покупку
    func payBasket(_ req: Request) throws -> EventLoopFuture<PayBasketResponse> {
        
        var summ = 0
        if !merchInCartArray.isEmpty {
            merchInCartArray.forEach { merch in
                summ += merch.value
            }
            message = "Вы приобрели товаров на сумму \(summ) уже никому не нужных евров"
            print(summ)
            // обнуление корзины
            merchInCartArray.removeAll()
            print(merchInCartArray)
        } else {
            message = "Корзина пустая"
        }
        

        let response = PayBasketResponse(
            cart_message: message,
            error_message: nil
        )

        return req.eventLoop.future(response)
    }
}
