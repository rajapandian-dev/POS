import Foundation
struct Product {
    var price: Double
    var quantity: Int
    init?(price: Double, quantity: Int) throws {
        if price < 0 {
            throw ProductError.invalidPrice
        }
        if quantity < 1 {
            throw ProductError.invalidQuantity
        }
        self.price = price
        self.quantity = quantity
    }
}
