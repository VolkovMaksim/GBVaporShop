//
//  RegisteredUsers.swift
//  
//
//  Created by Maksim Volkov on 06.08.2022.
//

import Foundation

class RegisteredUsers {
    let registeredUsers = UserDefaults.standard
    // создаем пустой архив для сохранения-регистрации пользователей [e-mail:Any]
    var usersDictionary = [String: Any]()
    // метод регистрации/проверки занятости e-mail регистрирующегося пользователя
    func usersRegistration(body: RegistrationRequest) -> UsersMessage {
        // проверяем словарь на наличие объекта с ключом email
        guard let _ = registeredUsers.object(forKey: body.email) as? [String:Any] else {
            // если в UserDefaults нет записи по переданному e-mail, то добавляем пользователя в словарь и возвращаем ответ сервера
            usersDictionary["username"] = body.username
            usersDictionary["email"] = body.email
            usersDictionary["password"] = body.password
            usersDictionary["credit_card"] = body.credit_card
            usersDictionary["itemsInCart"] = 0
            
            // сохраняем словарь с данными нового пользователя
            registeredUsers.set(usersDictionary, forKey: body.email)
            print(usersDictionary)
            return .successfulRegistration
        }
        // если в словаре есть запись по переданному e-mail
        return .emailAlreadyExists
    }
    
    func usersAuthorization(body: AuthorizationRequest) -> (UsersMessage, User?) {
        // достаем словарь с данными пользователя по email, если такой словарь есть
        guard let saveData = registeredUsers.object(forKey: body.email) as? [String:Any] else {
            // если в памяти нет такого ключа-email
            return (.emailNotExists, nil)
        }
        // если в памяти есть запись по переданному email
        print(saveData)
        // проверяем соответствие введенного при авторизации пароля с паролем, введенным при регистрации
        guard (saveData["password"] as! String) == body.password else {
            // если введен неправильный пароль
            return (UsersMessage.wrongPassword, nil)
        }
        // задаем свойства пользователю
        let authUser = User(username: saveData["username"] as! String,
                            email: saveData["email"] as! String,
                            password: saveData["password"] as! String,
                            credit_card: saveData["credit_card"] as! String,
                            itemsInCart: saveData["itemsInCart"] as? Int)
        
        print(authUser)
        return (.successfulAuthorization, authUser)
    }
    
    func usersEditPersonalData(body: EditPersonalDataRequest) -> UsersMessage {
        // достаем словарь с данными пользователя по email, если такой словарь есть
        guard var editPersonalData = registeredUsers.object(forKey: body.email) as? [String:Any] else {
            // если в памяти нет такого ключа-email
            return .emailNotExists
        }
        
        editPersonalData["username"] = body.username
        editPersonalData["email"] = body.email
        editPersonalData["password"] = body.password
        editPersonalData["credit_card"] = body.credit_card
        editPersonalData["itemsInCart"] = 0
        
        registeredUsers.set(editPersonalData, forKey: body.email)
        return .successfulEditPersonalData
    }
}
