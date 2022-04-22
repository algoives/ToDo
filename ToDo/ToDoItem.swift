//
//  ToDoItem.swift
//  ToDo
//
//  Created by Ives Murillo on 4/21/22.
//

import Foundation


struct ToDoItem{
   let title: String
   let itemDescription: String?
    
    init(title: String, itemDescription: String? = nil){
       self.title = title
       self.itemDescription = itemDescription
    }
    
}

