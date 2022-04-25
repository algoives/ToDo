//
//  ToDoItemDetailsViewController.swift
//  ToDo
//
//  Created by Ives Murillo on 4/24/22.
//

import UIKit
import MapKit

class ToDoItemDetailsViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var doneButton: UIButton!
    var toDoItem: ToDoItem? {
        didSet{
            titleLabel.text = toDoItem?.title
           //dateLabel.text = toDoItem?.timeStamp?.description
            descriptionLabel.text = toDoItem?.itemDescription
            locationLabel.text = toDoItem?.location?.name
            
            if let coordinate =  toDoItem?.location?.coordinate{
                mapView.setCenter(CLLocationCoordinate2D( latitude: coordinate.latitude, longitude: coordinate.longitude),animated: false)
            }
        }
    }
    
  
    
    
}
