//
//  ToDoItemsListViewController.swift
//  ToDo
//
//  Created by Ives Murillo on 4/23/22.
//

import UIKit
import Combine

protocol ToDoItemsListViewControllerProtocol {
    func selectTodoItem(_ viewController: UIViewController, item: ToDoItem)
    func addToDoItem(_ viewController: UIViewController)
}

class ToDoItemsListViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var toDoItemStore: ToDoItemStoreProtocol?
    private var items: [ToDoItem] = []
    private var token: AnyCancellable?
    let dateFormatter = DateFormatter()
    private var datasource: UITableViewDiffableDataSource<Section, ToDoItem>?
    var delegate: ToDoItemsListViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dateFormatter.dateStyle = .short
        // Do any additional setup after loading the view.
        datasource = UITableViewDiffableDataSource<Section, ToDoItem>(tableView: tableView, cellProvider: { [weak self] tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath) as! ToDoItemCell
            
            cell.titleLabel.text = item.title
            if let timestamp = item.timeStamp {
                let date = Date(timeIntervalSince1970: timestamp)
                cell.dateLabel.text = self?.dateFormatter.string(from: date)
            }
            return cell
        })
        token = toDoItemStore?.itemPublisher.sink(receiveValue:{ [weak self] items in self?.items = items
            self?.update(with: items)
        })
        
        tableView.register(ToDoItemCell.self, forCellReuseIdentifier: "ToDoItemCell")
       
        tableView.delegate = self
        
        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add(_ :)))
        navigationItem.rightBarButtonItem = addItem
        
    }
    
    private func update(with items: [ToDoItem ]){
        var sanapshot = NSDiffableDataSourceSnapshot<Section, ToDoItem>()
        sanapshot.appendSections([.todo, .done])
        sanapshot.appendItems(
        
            items.filter({ false == $0.done}),
            toSection: .todo)
        sanapshot.appendItems(items.filter({$0.done}),toSection: .done
        )
        datasource?.apply(sanapshot)
    }
    
    @objc func add(_ sender: UIBarButtonItem){
        delegate?.addToDoItem(self)
    }
    

  

}

/*extension ToDoItemsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath) as! ToDoItemCell
        
        let item = items[indexPath.row]
        cell.titleLabel.text = item.title
        
        if let timestamp = item.timeStamp {
            let date = Date(timeIntervalSince1970: timestamp)
            cell.dateLabel.text = dateFormatter.string(from: date)
        }
        
        return cell
    }
}*/

enum Section {
    case todo
    case done
}
extension ToDoItemsListViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        delegate?.selectTodoItem(self, item: item)
    }
}
