//
//  CoreDataIntegrationTests.swift
//  CodeWarsTestingTests
//
//  Created by Максим Неверовский on 11.04.2022.
//

import XCTest
import CoreData
@testable import CodeWarsTesting

class CoreDataIntegrationTests: XCTestCase {
            
    var resultManager: ResultCoreDataManager!
    var coreDataStack: CoreDataTestStack!

    override func setUp() {
        super.setUp()
        coreDataStack = CoreDataTestStack()
        resultManager = ResultCoreDataManager(mainContext: coreDataStack.mainContext)
    }

    func testWhenCreateEntityResult() {
        resultManager.createResult(answer: "[1, 2, 3]")
        let results = resultManager.fetchResults()

        XCTAssertEqual("[1, 2, 3]", results?.last?.test)
    }
        
    func testWhenUpdateEntityResult() {
        resultManager.createResult(answer: "[1, 2, 3, 4]")
        resultManager.updateResult(answer: "[1, 2, 3, 4, 5]")
        let results = resultManager.fetchResults()
        
        XCTAssertNotNil(resultManager.fetchResults)
        XCTAssertEqual("[1, 2, 3, 4, 5]", results?.last?.test)
    }

    func testtestWhenDeleteLastEntityResult() {
        resultManager.createResult(answer: "[1, 1, 1]")
        resultManager.deleteLastResult()
        let results = resultManager.fetchResults()
        
        XCTAssertTrue(((results!.last?.test?.contains("[1, 1, 1]")) == nil))
    }
}
