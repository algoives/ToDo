//
//  ToDoItemStoreProtocolMock.swift
//  ToDoTests
//
//  Created by Ives Murillo on 4/24/22.
//

import Foundation

import Combine

@testable import ToDo

class ToDoItemStoreProtocolMock: ToDoItemStoreProtocol {
   
    var itemPublisher = CurrentValueSubject<[ToDoItem], Never>([])
    
    var checkLastCallArgument: ToDoItem?

    func check(_ item: ToDoItem) {
        checkLastCallArgument = item
    }
    
}



