//
//  TaxCalculatorTests.swift
//  POSTests
//
//  Created by 01HW344246 on 14/01/20.
//  Copyright © 2020 RJ. All rights reserved.
//

import XCTest
@testable import POS
class TaxCalculatorTests: XCTestCase {
    
    func testShouldThrowInvalidErrorWhenEmptyStateGiven() {
        XCTAssertThrowsError(try TaxCalculator(totalPrice: 10.00, stateCode: "")) { ( error ) in
            XCTAssertEqual(error as? TaxError, TaxError.invalidState)
        }
    }
    
    func testShouldThrowInvalidErrorWhenUnavailableStateGiven() {
        XCTAssertThrowsError(try TaxCalculator(totalPrice: 10.00, stateCode: "TN")) { ( error ) in
            XCTAssertEqual(error as? TaxError, TaxError.invalidState)
        }
    }
    
    func testTaxCalculatorNotNilWhenValidInputGiven() throws {
        let taxCalculator = try TaxCalculator(totalPrice: 70.00, stateCode: "DK")
        XCTAssertNotNil(taxCalculator)
    }
    
    func testTaxAWhenValidInputGiven() throws {
        let taxCalculator = try TaxCalculator(totalPrice: 1000.00, stateCode: "DK")
        if let tax = taxCalculator?.getTax() {
            XCTAssertEqual(tax.amount, 250.00)
            XCTAssertEqual(tax.percentage, 25.00)
        }
    }
}
