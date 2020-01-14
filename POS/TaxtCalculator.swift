class TaxCalculator {
    private let totalPrice: Double
    private let stateCode: String
    private let taxes: [String: Double] = ["DE": 19.0, "DK": 25.0, "HR": 25.0, "IS": 25.5, "CH": 8.0]
    
    init?(totalPrice: Double, stateCode: String) throws {
        if stateCode.isEmpty {
            throw TaxError.invalidState
        }
        if taxes.keys.contains(stateCode) == false {
            throw TaxError.invalidState
        }
        if totalPrice < 0 {
            throw TaxError.invalidPrice
        }
        self.totalPrice = totalPrice
        self.stateCode = stateCode
    }
    
    func getTax() -> Tax {
        let taxPercentage = taxes[stateCode]!
        let taxAmount = totalPrice * (taxPercentage / 100.00)
        return Tax(amount: taxAmount, percentage: taxPercentage)
    }
}
