//
//  AuthorizationController.swift
//  
//
//  Created by Maksim Volkov on 07.08.2022.
//

import Vapor

class AuthorizationController {
    let registeredUser = RegisteredUsers()
    var authStatus = 0
    func authorization(_ req: Request) throws -> EventLoopFuture<AuthorizationResponse> {
        // проверяем, что body - не дырка от бублика
        guard let body = try? req.content.decode(AuthorizationRequest.self) else {
            throw Abort(.badRequest)
        }
        // проверяем пользователя по e-mail и usersMessage
        let (usersMessage, authUser) = registeredUser.usersAuthorization(body: body)
        switch usersMessage.rawValue {
        case "Успешная авторизация!":
            authStatus = 1
        case "Такой E-mail не зарегистрирован":
            authStatus = 2
        case "Неправильный пароль!":
            authStatus = 3
        default:
            authStatus = 0
        }
        let response = AuthorizationResponse(
            username: authUser?.username,
            email: authUser?.email,
            password: authUser?.password,
            credit_card: authUser?.credit_card,
            itemsInCart: authUser?.itemsInCart,
            result: authStatus,
            // передаем клиенту сообщение о результате регистрации/проверке занятости e-mail
            user_message: usersMessage.rawValue,
            error_message: nil
        )

        return req.eventLoop.future(response)
    }
}
