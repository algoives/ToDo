//
//  ToDoItemStore.swift
//  ToDo
//
//  Created by Ives Murillo on 4/22/22.
//

import Foundation
import Combine

protocol ToDoItemStoreProtocol{
    var itemPublisher:
    CurrentValueSubject<[ToDoItem], Never>
    {get set}
    func check(_ : ToDoItem)
}

class ToDoItemStore: ToDoItemStoreProtocol{
    
    private let fileName: String
    
    var itemPublisher = CurrentValueSubject<[ToDoItem], Never>([])
    
    init(fileName: String = "todoitems"){
        self.fileName = fileName
        loadItems()
    }
    
    private var items: [ToDoItem] = []{
        didSet{
            itemPublisher.send(items)
        }
    }
    
    func add(_ item: ToDoItem){
       items.append(item)
        saveItems()
    }
    
    func check(_ item: ToDoItem){
        
        var mutableIttem = item
        mutableIttem.done = true
        if let index = items.firstIndex(of: item){
            items[index] = mutableIttem
            saveItems()
        }
    }
    
    private func saveItems() {
         let url = FileManager.default.documentsURL(name: fileName)
            do{
                let data = try JSONEncoder().encode(items)
                try data.write(to: url)
                
            } catch {
                print("error: \(error)")
            }
    }
    
    private func loadItems(){
         let url = FileManager.default.documentsURL(name: fileName)
            do{
                let data = try Data(contentsOf: url)
                items = try JSONDecoder().decode([ToDoItem].self, from: data)
            } catch {
                print("error: \(error)")
            }
    }
    
}
