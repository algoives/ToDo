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

}
