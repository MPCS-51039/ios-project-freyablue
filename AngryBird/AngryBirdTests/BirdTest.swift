//
//  BirdTest.swift
//  AngryBirdTests
//
//  Created by Yijia chen on 2023/4/21.
//

import XCTest
@testable import AngryBird

final class BirdTest: XCTestCase {


    func testBirdDebugDescription() throws {
        func testBirdDebugDescription(){
            //Given
            let bird = Bird(named: "test whale", description: "This is for testing", imageURL: "https://i.pinimg.com/originals/0e/27/0a/0e270a8cead43f01465749333164d561.jpg")
            //When
            let actualValue = bird.debugDescription
            
            //Then
            let expectedValue = "Bird(name: test whale, description: This is for testing)"
            XCTAssertEqual(actualValue, expectedValue)
        }
    }


}
