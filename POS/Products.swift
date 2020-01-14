import Foundation
class Products {
    private var list: [Product]
    private var stateCode: String
    private var taxCalculator: TaxCalculator
    
    init(list: [Product] = [], stateCode: String) throws {
        self.list = list
        self.stateCode = stateCode
        do {
            taxCalculator = try TaxCalculator(stateCode: stateCode)
        } catch TaxError.invalidState {
            throw TaxError.invalidState
        }
    }
    
    func addProduct(product: Product) {
        self.list.append(product)
    }
    
    func getNetPrice() -> Price {
        return getFinalPrice()
    }
    
    private func getFinalPrice() -> Price {
        let totalPrice = getTotalPrice()
        let discountAmount = getDiscountAmount(for: totalPrice)
        let discountedPrice = totalPrice - discountAmount
        let netPrice = discountedPrice + getTaxAmount(for: discountedPrice)
        return Price(value: netPrice)
    }
    
    private func getTotalPrice() -> Double {
        return list.compactMap({ $0.price * Double($0.quantity) }).reduce(0.00, +)
    }
    
    private func getDiscountAmount(for price: Double) -> Double {
        return DiscountCalculator(totalPrice: price).getDiscount().amount
    }

    private func getTaxAmount(for price: Double) -> Double {
        return taxCalculator.getTax(for: price).amount
    }
}
