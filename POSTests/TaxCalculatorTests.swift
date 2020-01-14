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
        XCTAssertThrowsError(try TaxCalculator(stateCode: "")) { ( error ) in
            XCTAssertEqual(error as? TaxError, TaxError.invalidState)
        }
    }
    
    func testShouldThrowInvalidErrorWhenUnavailableStateGiven() {
        XCTAssertThrowsError(try TaxCalculator(stateCode: "TN")) { ( error ) in
            XCTAssertEqual(error as? TaxError, TaxError.invalidState)
        }
    }
    
    func testTaxCalculatorShouldNotThrowWhenValidStateGiven() {
        XCTAssertNoThrow(try TaxCalculator(stateCode: "DK"))
    }
    
    func testTaxWhenValidInputGiven() {
        XCTAssertEqual(try TaxCalculator(stateCode: "DK").getTax(for: 1500.00).amount, 375.00)
        XCTAssertEqual(try TaxCalculator(stateCode: "DE").getTax(for: 1500.00).amount, 285.00)
        XCTAssertEqual(try TaxCalculator(stateCode: "IS").getTax(for: 1500.00).amount, 382.50)
        XCTAssertEqual(try TaxCalculator(stateCode: "CH").getTax(for: 1500.00).amount, 120.00)
    }
}
