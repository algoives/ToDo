//
//  URLSessionProtocolMock.swift
//  ToDoTests
//
//  Created by Ives Murillo on 4/26/22.
//

import Foundation
@testable import ToDo

class URLSessionProtocolMock: URLSessionProtocol{
   
    
    var dataForDelegateReturnValue: (Data, URLResponse)?
    var dataForDelegateRequest: URLRequest?
    var dataForDelegateError: Error?
    
    func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        
        //to make the test fail
       // throw NSError(domain: "dummy", code: 0)
        
        if let error = dataForDelegateError{
            throw error
        }
        dataForDelegateRequest = request
        
        
        guard let dataForDelegateReturnValue = dataForDelegateReturnValue else {
            fatalError()
        }
        return dataForDelegateReturnValue

    }
}
