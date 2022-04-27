//
//  ViewControllerMock.swift
//  ToDoTests
//
//  Created by Ives Murillo on 4/26/22.
//

import UIKit

class ViewControllerMock: UIViewController{
    var lastPresented: UIViewController?
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        lastPresented = viewControllerToPresent
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
}
