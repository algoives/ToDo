//
//  ToDoItemData.swift
//  ToDo
//
//  Created by Ives Murillo on 4/25/22.
//

import Foundation

class ToDoItemData: ObservableObject{
    @Published var title = ""
    @Published var date = Date()
    @Published var withDate = false
    @Published var itemDescription = ""
    @Published var location = ""
    @Published var addressString = ""
    
}
