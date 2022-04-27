//
//  ToDoItem.swift
//  ToDo
//
//  Created by Ives Murillo on 4/21/22.
//

import Foundation


struct ToDoItem: Equatable, Codable{
    
   let id: UUID
   let title: String
   let itemDescription: String?
   let timeStamp: TimeInterval?
   let location: Location?
   var done = false
    
    init(title: String,
         itemDescription: String? = nil,
         timeStamp: TimeInterval? = nil,
         location: Location? = nil){
       
       self.id = UUID()
       self.title = title
       self.itemDescription = itemDescription
       self.timeStamp = timeStamp
       self.location = location
    }
    
    static func == (lhs: ToDoItem, rhs: ToDoItem) -> Bool{
        return lhs.id == rhs.id
    }
    
    
}

extension ToDoItem: Hashable{
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
