class TaxCalculator {
    private let stateCode: String
    private let taxes: [String: Double] = ["DE": 19.0, "DK": 25.0, "HR": 25.0, "IS": 25.5, "CH": 8.0]
    
    init(stateCode: String) throws {
        if stateCode.isEmpty {
            throw TaxError.invalidState
        }
        if taxes.keys.contains(stateCode) == false {
            throw TaxError.invalidState
        }
        self.stateCode = stateCode
    }
    
    func getTax(for price: Double) -> Tax {
        let taxPercentage = taxes[stateCode]!
        let taxAmount = price * (taxPercentage / 100.00)
        return Tax(amount: taxAmount, percentage: taxPercentage)
    }
}
