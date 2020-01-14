import Foundation
struct Product {
    let price: Double
    let quantity: Int
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

struct Price {
    let value: Double
    init(value: Double) {
        self.value = value
    }
}

class Discount {
    let amount: Double
    let percentage: Double
    init(amount: Double, percentage: Double) {
        self.amount = amount
        self.percentage = percentage
    }
}

class Tax: Discount {
    override init(amount: Double, percentage: Double) {
        super.init(amount: amount, percentage: percentage)
    }
}
