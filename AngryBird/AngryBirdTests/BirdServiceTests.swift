//
//  BirdServiceTests.swift
//  AngryBirdTests
//
//  Created by Yijia chen on 2023/4/19.
//

import XCTest
@testable import AngryBird

final class BirdServiceTests: XCTestCase {
    var systemUnderTest: BirdService!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.systemUnderTest = BirdService()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.systemUnderTest = nil
    }

    func testAPI_returnsSuccessfulResult() throws {
        //Given
        var birds: [Bird]!
        var error: Error?
        let promise = expectation(description: "Completion handler is invoked")
        //when
        self.systemUnderTest.getBirds(completion:{ data, shouldntHappen in
            birds = data
            error = shouldntHappen
            promise.fulfill()

        })
        wait(for: [promise], timeout: 5)
        
        //THEN
        XCTAssertNotNil(birds)
        XCTAssertNil(error)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
