//
//  RegistrationController.swift
//  
//
//  Created by Maksim Volkov on 05.08.2022.
//

import Vapor

class RegistrationController {
    let registeredUser = RegisteredUsers()
    var authStatus = 0
    func registration(_ req: Request) throws -> EventLoopFuture<ReqistrationResponse> {
        // проверяем, что body - не дырка от бублика
        guard let body = try? req.content.decode(RegistrationRequest.self) else {
            throw Abort(.badRequest)
        }
        // передаем нового пользлователя на проверку занятости e-mail и запись в словарь с получением сообщения об успешности/неуспешности
        let usersMessage = registeredUser.usersRegistration(body: body)
        switch usersMessage.rawValue {
        case "Регистрация прошла успешно!":
            authStatus = 1
        case "Пользователь с таким E-mail уже зарегистрирован":
            authStatus = 2
        default:
            authStatus = 0
        }
        let response = ReqistrationResponse(
            result: authStatus,
            // передаем клиенту сообщение о результате регистрации/проверке занятости e-mail
            user_message: usersMessage.rawValue,
            error_message: nil
        )

        return req.eventLoop.future(response)
    }
}

