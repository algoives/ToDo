//
//  ToDoItemStore.swift
//  ToDo
//
//  Created by Ives Murillo on 4/22/22.
//

import Foundation
import Combine

class ToDoItemStore{
    
    var itemPublisher = CurrentValueSubject<[ToDoItem], Never>([])
    
    private var items: [ToDoItem] = []{
        didSet{
            itemPublisher.send(items)
        }
    }
    
    func add(_ item: ToDoItem){
       items.append(item)
    }
    
    func check(_ item: ToDoItem){
        
        var mutableIttem = item
        mutableIttem.done = true
        if let index = items.firstIndex(of: item){
            items[index] = mutableIttem
        }
        
    }
    
}
