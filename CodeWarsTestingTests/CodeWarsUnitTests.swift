//
//  CodeWarsTestingTests.swift
//  CodeWarsTestingTests
//
//  Created by Максим Неверовский on 08.04.2022.
//

import XCTest
@testable import CodeWarsTesting

class CodeWarsUnitTests: XCTestCase {
    var foldArray = CodeWarsTask()
    
    func testWhenInputIsEmptyArray() {
        let array = [] as [Int]
        let result = foldArray.foldArray(arr: array)
        XCTAssertEqual(result, [])
    }
    
    func testWhenInputIsNegativeAndPositiveNumbers() {
        let array = [-9, 10, -100, -234, 34, 5] as [Int]
        let result = foldArray.foldArray(arr: array)
        XCTAssertEqual( result, [-4, 44, -334])
    }
    
    func testWhenInputIsTimesMoreLengthArray() {
        let array = [1, 2, 3, 4, 5] as [Int]
        let result = foldArray.foldArray(arr: array, times: 10)
        XCTAssertEqual( result, [15])
    }
    
    func testWhenInputIsTimesEqualZero() {
        let array = [1, 2, 3, 4, 5] as [Int]
        let result = foldArray.foldArray(arr: array, times: 0)
        XCTAssertEqual( result, [1, 2, 3, 4, 5])
    }
    
    func testWhenInputArrayModified() {
        let array = [1, 2, 3, 4, 5] as [Int]
        _ = foldArray.foldArray(arr: array, times: 10)
        XCTAssertEqual( array, [1, 2, 3, 4, 5])
    }
    
}
