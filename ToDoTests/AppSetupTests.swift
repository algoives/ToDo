//
//  AppSetupTests.swift
//  ToDoTests
//
//  Created by Ives Murillo on 4/26/22.
//

import XCTest
@testable import ToDo

class AppSetupTests: XCTestCase {

    func test_application_shouldSetupRoot() throws {
        let application = UIApplication.shared
        let scene = application.connectedScenes.first as? UIWindowScene
        let root = scene?.windows.first?.rootViewController
        
        let nav = try XCTUnwrap(root as? UINavigationController)
       
        
        XCTAssert(nav.topViewController is ToDoItemsListViewController)
        
        
    }

    

}
