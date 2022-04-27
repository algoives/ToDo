//
//  ToDoItemInputView.swift
//  ToDo
//
//  Created by Ives Murillo on 4/25/22.
//

import SwiftUI

protocol ToDoItemImputViewDelegate {
    func addToDoItem(with: ToDoItemData, coordinate: Coordinate?)
}


struct ToDoItemInputView: View {
    @ObservedObject var data: ToDoItemData
    let apiClient: APIClientProtocol
    var delegate: ToDoItemImputViewDelegate?
    
    //removed to move withDate to ToDoItemData
  //  var didAppear: ((Self) -> Void)?
  //  @State var withDate = false
   
    
    var body: some View {
        
        Form{
            SwiftUI.Section{
                
                TextField("Title", text: $data.title)
                Toggle("Add Date", isOn: $data.withDate)
                if data.withDate{
                    DatePicker("Date", selection: $data.date)
                    
                }
                TextField("Description", text: $data.itemDescription)
            }
            SwiftUI.Section{
                TextField("Location name", text: $data.location)
                TextField("Address", text: $data.addressString)
                
            }
            SwiftUI.Section{
                Button(action: addToDoItem, label: {
                    Text("Save")
                })
            }
        }
       
       // .onAppear()
        
    }
    
    func addToDoItem(){
        
        if false == data.addressString.isEmpty{
            apiClient.coordinate(for: data.addressString, completion: {coordinate in
                self.delegate?.addToDoItem(with: data, coordinate: coordinate)
            })
            
        } else {
            delegate?.addToDoItem(with: data, coordinate: nil)
        }
        
    }
}

struct ToDoItemInputView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemInputView(data: ToDoItemData(), apiClient: APIClient())
            .previewLayout(.sizeThatFits)
    }
}
