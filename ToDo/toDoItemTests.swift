//
//  toDoItemTests.swift
//  ToDoTests
//
//  Created by Ives Murillo on 4/21/22.
//

import XCTest
@testable import ToDo

class toDoItemTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_init_takesTitle(){
        ToDoItem(title: "Dumy")
    }

}
