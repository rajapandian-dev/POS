import XCTest
@testable import POS

class DiscountCalculatorTests: XCTestCase {
    
    func testDiscountValueWhenValidPriceGiven() throws {
        let discountCalculator = try DiscountCalculator(totalPrice: 3400)
        let discount = discountCalculator?.getDiscount()
        XCTAssertEqual(discount?.percentage, 3)
        XCTAssertEqual(discount?.amount, 102)
    }
    
    func testShouldThrowInvalidPriceWhenInvalidPriceGiven() {
        XCTAssertThrowsError(try DiscountCalculator(totalPrice: -3400)) { ( error ) in
            XCTAssertEqual(error as? DiscountError, DiscountError.invalidPrice)
        }
    }
}
