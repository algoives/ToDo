//
//  NavigationControllerMock.swift
//  ToDoTests
//
//  Created by Ives Murillo on 4/26/22.
//

import UIKit

class NavigationControllerMock: UINavigationController{
    var lastPushedViewController: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        lastPushedViewController = viewController
        super.pushViewController(viewController, animated: animated)
    }
    
    var dismissCallCount = 0
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        dismissCallCount += 1
        
        super.dismiss(animated: flag, completion: completion)
    }
}
