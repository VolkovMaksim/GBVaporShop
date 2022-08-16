//
//  EditPersonalDataController.swift
//  
//
//  Created by Maksim Volkov on 16.08.2022.
//

import Vapor

class EditPersonalDataController {
    let registeredUser = RegisteredUsers()
    var authStatus = 0
    func editPersonalData(_ req: Request) throws -> EventLoopFuture<EditPersonalDataResponse> {
        // проверяем, что body - не дырка от бублика
        guard let body = try? req.content.decode(EditPersonalDataRequest.self) else {
            throw Abort(.badRequest)
        }
        let usersMessage = registeredUser.usersEditPersonalData(body: body)
        switch usersMessage.rawValue {
        case "Данные изменены успешно!":
            authStatus = 1
        default:
            authStatus = 0
        }
        let response = EditPersonalDataResponse(
            result: authStatus,
            // передаем клиенту сообщение о результате регистрации/проверке занятости e-mail
            user_message: usersMessage.rawValue,
            error_message: nil
        )

        return req.eventLoop.future(response)
    }
}
