//
//  SquareAssignmentTests.swift
//  SquareAssignmentTests
//
//  Created by Habib Durodola on 2020-07-28.
//  Copyright © 2020 DOH. All rights reserved.
//

import XCTest
@testable import SquareAssignment

class SquareAssignmentTests: XCTestCase {
    var employeeNNNs: [EmployeeElement] = []
    var errorCheck:String?

    func testEmployeeNotNull() { /// test to show that response can not be nill
        let expectation = self.expectation(description: "notNill")
        ApiManager().fetchFilms(inputJson: Constants.EMPLOYEES_JSON) {
            employee,err  in
            self.employeeNNNs = employee
            XCTAssertNotNil(employee)
            XCTAssertEqual("Justine Mason", employee[0].fullName)
            expectation.fulfill()
        }
        callWait()

    }


    func testEmptyEmployee() { /// test to show the employee count is 0
        let expectation = self.expectation(description: "Empty")

        ApiManager().fetchFilms(inputJson: Constants.EMPLOYEES_EMPTY_JSON) {
            employee,err  in

            XCTAssertEqual(0, employee.count)

            expectation.fulfill()

        }
        callWait()

    }

    func testMalformedEmployee() {///test to show malformed json returns error
        let expectation = self.expectation(description: "Malformed")

        ApiManager().fetchFilms(inputJson: Constants.EMPLOYEES_MALFORMED_JSON) {
            employee,err  in

            XCTAssertEqual("error", err)

            expectation.fulfill()

        }
        callWait()
    }

    func callWait()  {
        self.waitForExpectations(timeout: 10) { (error) in
            guard error == nil else {
                XCTAssert(false)
                NSLog("Timeout Error.")
                return
            }
        }

    }

}
