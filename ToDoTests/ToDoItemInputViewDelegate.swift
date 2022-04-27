//
//  ToDoItemInputViewDelegate.swift
//  ToDoTests
//
//  Created by Ives Murillo on 4/26/22.
//

import Foundation
@testable import ToDo

class ToDoItemInputViewDelegateMock: ToDoItemImputViewDelegate{
   
    
    
    var lastTodoItemData: ToDoItemData?
    var lastCoordinate: Coordinate?
    
    func addToDoItem(with data: ToDoItemData, coordinate: Coordinate?) {
        lastTodoItemData = data
        lastCoordinate = coordinate
    }
}
