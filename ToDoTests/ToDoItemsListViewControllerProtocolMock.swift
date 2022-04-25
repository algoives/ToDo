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
    
    var selectToDoItemReceivedArguments:(viewController: UIViewController, item: ToDoItem)?
    
    
    
    func selectTodoItem(_ viewController: UIViewController, item: ToDoItem) {
        selectToDoItemReceivedArguments = (viewController, item)
    }
    
    
    
}
