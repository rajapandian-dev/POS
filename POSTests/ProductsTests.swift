import XCTest
@testable import POS

class ProductsTests: XCTestCase {

    func testShouldThrowInvalidStateWhenInvalidStateGiven(){
        XCTAssertThrowsError(try Products(stateCode: "KL")) { ( error ) in
            XCTAssertEqual(error as? TaxError, TaxError.invalidState)
        }
    }

    func testShouldNotThrowWhenValidProductInputGiven(){
        XCTAssertNoThrow(try Products(stateCode: "DK"))
    }
    
    func testShouldNotThrowWhenEmptyProductsListGiven(){
        XCTAssertNoThrow(try Products(list: [], stateCode: "DK"))
    }
    
    func testShouldReturnFinalPriceWhenValidInputGiven() throws {
        let product = try Products(list: getProductsList(), stateCode: "DK")
        let finalPrice = product.getNetPrice()
        XCTAssertEqual(finalPrice.value, 93500.00)
    }
    
    func testShouldReturnPriceZeroWhenNoPorductsGiven() throws {
        let product = try Products(list: [], stateCode: "DK")
        let finalPrice = product.getNetPrice()
        XCTAssertEqual(finalPrice.value, 0.00)
    }
    
    func getProductsList() -> [Product] {
        return [try! Product(price: 10000.00, quantity: 3)!, try! Product(price: 20000.00, quantity: 1)!, try! Product(price: 19000.00, quantity: 2)!]
    }
}
