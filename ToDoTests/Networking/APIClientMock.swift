//
//  APIClientMock.swift
//  ToDoTests
//
//  Created by Ives Murillo on 4/25/22.
//

import Foundation
@testable import ToDo

class APIClientMock: APIClientProtocol{
    
    var coordinateAddress: String?
    var coordinateReturnValue: Coordinate?
    
    func coordinate(for address: String, completion: (Coordinate?) -> Void) {
        coordinateAddress = address
        completion(coordinateReturnValue)
    }
    
    
}
