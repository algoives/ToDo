//
//  ToDoItemsListViewControllerProtocolMock.swift
//  ToDoTests
//
//  Created by Ives Murillo on 4/24/22.
//

import Foundation
@testable import ToDo
import UIKit
class ToDoItemsListViewControllerProtocolMock: ToDoItemsListViewControllerProtocol{
    
    var addToDoItemCallCount = 0
    
    var selectToDoItemReceivedArguments:(viewController: UIViewController, item: ToDoItem)?
    
    
    
    func selectTodoItem(_ viewController: UIViewController, item: ToDoItem) {
        selectToDoItemReceivedArguments = (viewController, item)
    }
    
    func addToDoItem(_ viewController: UIViewController) {
        addToDoItemCallCount += 1
    }
}
