//
//  BirdListViewControllerTests.swift
//  AngryBirdTests
//
//  Created by Yijia chen on 2023/4/23.
//

import XCTest
@testable import AngryBird

class BirdListViewControllerTests: XCTestCase {
    var systemUnderTest: BirdListViewController!

    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        self.systemUnderTest = navigationController.topViewController as? BirdListViewController
        
        UIApplication.shared.windows
            .filter { $0.isKeyWindow }
            .first!
            .rootViewController = self.systemUnderTest
        
        XCTAssertNotNil(navigationController.view)
        XCTAssertNotNil(self.systemUnderTest.view)
    }

    func testTableView_loadsBirds() {
        //Given
        let mockBirdService = MockBirdService()
        let mockBirds = [
            Bird(named: "Oriole", description: "Angry", imageURL: "birds.com/angryoriole"),
            Bird(named: "Cardinal", description: "Angry", imageURL: "birds.com/angrycardinal"),
            Bird(named: "Robin", description: "Angry", imageURL: "birds.com/angryrobin"),
        ]
        mockBirdService.mockBirds = mockBirds
        
        self.systemUnderTest.viewDidLoad()
        self.systemUnderTest.birdService = mockBirdService
        
        XCTAssertEqual(0, self.systemUnderTest.tableView.numberOfRows(inSection: 0))
        
        //When
        self.systemUnderTest.viewWillAppear(false)
        
        //Then
        XCTAssertEqual(mockBirds.count, self.systemUnderTest.flock.count)
        XCTAssertEqual(mockBirds.count, self.systemUnderTest.tableView.numberOfRows(inSection: 0))
    }
    
    class MockBirdService: BirdService {
        var mockBirds: [Bird]?
        var mockError: Error?
        
        override func getBirds(completion: @escaping ([Bird]?, Error?) -> ()) {
            completion(mockBirds, mockError)
        }
    }
}
