//
//  ToDoItemInputViewTests.swift
//  ToDoTests
//
//  Created by Ives Murillo on 4/25/22.
//

import XCTest
@testable import ToDo
import ViewInspector

extension ToDoItemInputView: Inspectable{
    
}

class ToDoItemInputViewTests: XCTestCase {
    
    var sut: ToDoItemInputView!
    var toDoItemData: ToDoItemData!
    var apiClientMock: APIClientMock!

    override func setUpWithError() throws {
        toDoItemData = ToDoItemData()
        apiClientMock = APIClientMock()
        sut = ToDoItemInputView(data: toDoItemData, apiClient: apiClientMock)
        
    }

    override func tearDownWithError() throws {
        sut = nil
        toDoItemData = nil
        apiClientMock = nil
    }
    
    func test_titleInput_shouldSetValueInData() throws {
        let expected = "dummy title"
        try sut
            .inspect()
            .find(ViewType.TextField.self, where: { view in
                let label = try view
                    .labelView()
                    .text()
                    .string()
                return label == "Title"
            })
            .setInput(expected)
        
        let input = toDoItemData.title
        
        XCTAssertEqual(input, expected)
    }
    
    func test_whenWithoutDate_shouldNotShowDateInput() throws {
       XCTAssertThrowsError(try sut
        .inspect()
        .find(ViewType.DatePicker.self))
    }
    
    func test_whenWithDate_shouldAllowDateInput() throws {
       /* let exp = sut.on(\.didAppear) { view in
            try view.find(ViewType.Toggle.self).tap()
            
            let expected = Date(timeIntervalSinceNow: 1_000_000)
            try view
                .find(ViewType.DatePicker.self)
                .select(date: expected)
            
            let input = self.toDoItemData.date
            XCTAssertEqual(input, expected)
            
        }
        ViewHosting.host(view: sut)
        wait(for: [exp], timeout: 0.1)*/
       
        
        // implementacion to move withDate to ToDoItemData
        let expected = Date()
        
        try sut.inspect().find(ViewType.Toggle.self).tap()
        try sut
            .inspect()
            .find(ViewType.DatePicker.self)
            .select(date: expected)
        
        let input = toDoItemData.date
        
        XCTAssertEqual(input, expected)
        
    }
    

    func test_shouldAllowdDescriptionInput() throws {
        let expected = "dummy description"
        try sut
            .inspect()
            .find(ViewType.TextField.self, where: {view in
                let label = try view
                    .labelView()
                    .text()
                    .string()
                return label == "Description"
            })
            .setInput(expected)
        
        let input = toDoItemData.itemDescription
        
        XCTAssertEqual(input, expected)
    }
    
    func test_shouldAllowdLocatioinInput() throws {
        let expected = "dummy location"
        try sut
            .inspect()
            .find(ViewType.TextField.self, where: {view in
                let label = try view
                    .labelView()
                    .text()
                    .string()
                return label == "Location name"
            })
            .setInput(expected)
        
        let input = toDoItemData.location
        
        XCTAssertEqual(input, expected)
    }
    
    func test_shouldAllowdAddressStringInput() throws {
        let expected = "dummy address"
        try sut
            .inspect()
            .find(ViewType.TextField.self, where: {view in
                let label = try view
                    .labelView()
                    .text()
                    .string()
                return label == "Address"
            })
            .setInput(expected)
        
        let input = toDoItemData.addressString
        
        XCTAssertEqual(input, expected)
    }
    
    func test_shouldHaveASaveButton() throws {
        XCTAssertNoThrow(try sut
            .inspect()
            .find(ViewType.Button.self, where: { view in
                let label = try view
                    .labelView()
                    .text()
                    .string()
                return label == "Save"
            }))
    }
    
    func test_saveButton_shouldFetchCoordinate() throws {
        toDoItemData.title = "dummy title"
        let expected = "dummy address"
        toDoItemData.addressString = expected
        
        try sut.inspect()
            .find(ViewType.Button.self,
                  where: {view in
                let label = try view
                    .labelView()
                    .text()
                    .string()
                return label == "Save"
            })
            .tap()
        
        XCTAssertEqual(apiClientMock.coordinateAddress, expected)
    }
    
    func test_save_whenAddressIsEmpty_shouldNotFetchCoordinate() throws {
        toDoItemData.title = "dummy title"
       
        
        try sut.inspect()
            .find(ViewType.Button.self,
                  where: {view in
                let label = try view
                    .labelView()
                    .text()
                    .string()
                return label == "Save"
            })
            .tap()
        
        XCTAssertNil(apiClientMock.coordinateAddress)
    }
    
    func test_save_shouldCallDelegate() throws {
        toDoItemData.title = "dummy title"
        toDoItemData.addressString = "dummy address"
        apiClientMock.coordinateReturnValue = Coordinate(latitude: 1, longitude: 2)
        let delegateMock = ToDoItemInputViewDelegateMock()
        sut.delegate = delegateMock
        
        try sut.tapButtonWith(name: "Save")
            
        
        XCTAssertEqual(delegateMock.lastTodoItemData?.title, "dummy title")
        
        XCTAssertEqual(delegateMock.lastCoordinate?.latitude, 1)
        
        XCTAssertEqual(delegateMock.lastCoordinate?.longitude , 2)
    }
    
    
    func test_save_whenAddressEmpty_shouldCallDelegate() throws {
        toDoItemData.title = "dummy title"
       
        apiClientMock.coordinateReturnValue = Coordinate(latitude: 1, longitude: 2)
        let delegateMock = ToDoItemInputViewDelegateMock()
        sut.delegate = delegateMock
        
        try sut.tapButtonWith(name: "Save")
            
        
        XCTAssertEqual(delegateMock.lastTodoItemData?.title, "dummy title")
        
        
    }
    
}

extension ToDoItemInputView {
    func tapButtonWith(name: String) throws {
    
        try inspect()
            .find(ViewType.Button.self,
                  where: { view in
                let label = try view
                    .labelView()
                    .text()
                    .string()
                return label == name
            })
            .tap()
    
    }
}
