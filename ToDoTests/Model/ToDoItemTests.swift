//
//  ToDoItemTests.swift
//  ToDoTests
//
//  Created by Ives Murillo on 4/21/22.
//

import XCTest
@testable import ToDo

class ToDoItemTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_init_whenGivenTitle_setsTitle(){
        let item = ToDoItem(title: "Dumy")
        XCTAssertEqual(item.title, "Dumy")
    }
    
    func test_init_takesTitleAndDescription(){
        let item = ToDoItem(title: "Dumy", itemDescription: "Dumy description")
        
        XCTAssertEqual(item.itemDescription,  "Dumy description")
    }
    
    func test_init_setsTimestamp() throws {
        
        let dummyTimestamp: TimeInterval = 42.0
        let item = ToDoItem(title: "Dumy", timeStamp: dummyTimestamp)
        
        let timeStamp = try XCTUnwrap(item.timeStamp)
        
        XCTAssertEqual(timeStamp , dummyTimestamp, accuracy: 0.000_001)
        
    }
    
    func test_init_whenGivenLocation_setsLocation(){
        let dummyLocation = Location(name: "Dummy Name")
        let item = ToDoItem(title: "Dummy title", location: dummyLocation)
        
        XCTAssertEqual(item.location?.name, dummyLocation.name)
        
    }

}
