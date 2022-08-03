import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    //MARK: ПРОДАЖА
    let controllerSale = SaleController()
    // при запросе на url "sale" будет использован класс SaleController - метод sale
    app.post("sale", use: controllerSale.sale)

    try app.register(collection: TodoController())
}
