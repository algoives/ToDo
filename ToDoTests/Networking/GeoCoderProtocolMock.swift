//
//  GeoCoderProtocolMock.swift
//  ToDoTests
//
//  Created by Ives Murillo on 4/26/22.
//

import Foundation
@testable import ToDo
import CoreLocation

class GeoCoderProtocolMock: GeoCoderProtocol{
    
    var geocodeAddressString: String?
    var completionHandler: CLGeocodeCompletionHandler?
   
    func geocodeAddressString(_ addressSring: String, completionHandler: @escaping CLGeocodeCompletionHandler) {
        geocodeAddressString = addressSring
        self.completionHandler = completionHandler
    }
}
