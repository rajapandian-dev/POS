class DiscountCalculator {
    private let totalPrice: Double
    init?(totalPrice: Double) throws {
        if totalPrice < 0.00 {
            throw DiscountError.invalidPrice
        }
        self.totalPrice = totalPrice
    }
    func getDiscount() -> Discount {
        var discountAmount: Double = 0.00
        var discountPercentage: Double = 0.00
        switch self.totalPrice {
        case 1000..<4999:
            discountPercentage = 3.00
        case 5000..<6999:
            discountPercentage = 5.00
        case 7000..<9999:
            discountPercentage = 7.00
        case 10000..<49999:
            discountPercentage = 10.00
        case 49999...:
            discountPercentage = 15.00
        default:
            discountPercentage = 0.00
        }
        discountAmount = self.totalPrice * (discountPercentage / 100.00)
        return Discount(amount: discountAmount, percentage: discountPercentage)
    }
}
