import XCTest
@testable import POS

class ProductTests: XCTestCase {
    
    func testThrowPriceErrorWhenProductPriceInvalid() {
        XCTAssertThrowsError(try Product(price: -10, quantity: 1)) { ( error ) in
            XCTAssertEqual(error as? ProductError, ProductError.invalidPrice)
        }
    }
    
    func testThrowQuantityErrorWhenProductQuantityInvalid() {
        XCTAssertThrowsError(try Product(price: 10, quantity: 0)) { ( error ) in
            XCTAssertEqual(error as? ProductError, ProductError.invalidQuantity)
        }
    }
    
    func testAddedProductValue() throws {
        let product = try Product(price: 67, quantity: 7)
        XCTAssertEqual(product?.price, 67)
        XCTAssertEqual(product?.quantity, 7)
    }
}
