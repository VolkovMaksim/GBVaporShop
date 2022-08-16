import Fluent
import Vapor

func routes(_ app: Application) throws {
    //MARK: СТАРТОВАЯ СТРАНИЦА
    app.get { req async in
        "It works!"
    }

    //MARK: HELLO
    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    //MARK: ПРОДАЖА
    let controllerSale = SaleController()
    // при запросе на url "sale" будет использован класс SaleController - метод sale
    app.post("sale", use: controllerSale.sale)

    //MARK: РЕГИСТРАЦИЯ
    let controllerRegistration = RegistrationController()
    // при запросе на url "registration" будет использован класс RegistrationController - метод registration
    app.post("registration", use: controllerRegistration.registration)
    
    //MARK: АВТОРИЗАЦИЯ
    let controllerAuthorization = AuthorizationController()
    // при запросе на url "authorization" будет использован класс AuthorizationController - метод authorization
    app.post("authorization", use: controllerAuthorization.authorization)
    
    //MARK: ИЗМЕНЕНИЕ ПЕРСОНАЛЬНЫХ ДАННЫХ
    let controllerEditPersonalData = EditPersonalDataController()
    // при запросе на url "editpersonaldata" будет использован класс EditPersonalDataController - метод editPersonalData
    app.post("editpersonaldata", use: controllerEditPersonalData.editPersonalData)
    
    try app.register(collection: TodoController())
}
