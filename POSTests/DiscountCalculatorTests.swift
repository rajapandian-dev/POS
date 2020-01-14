import XCTest
@testable import POS

class DiscountCalculatorTests: XCTestCase {
    
    func testDiscountValueWhenPriceGiven() {
        let discountCalculator = DiscountCalculator(totalPrice: 3400)
        let discount = discountCalculator.getDiscount()
        XCTAssertEqual(discount.percentage, 3)
        XCTAssertEqual(discount.amount, 102)
    }
}
