//
//  FileManagerExtension.swift
//  ToDo
//
//  Created by Ives Murillo on 4/23/22.
//

import Foundation


extension FileManager{
    func documentsURL(name: String) -> URL {
        guard let documentsURL = urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError()
        }
        return documentsURL.appendingPathComponent(name)
    }
}
