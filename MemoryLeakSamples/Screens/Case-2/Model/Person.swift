//
//  Person.swift
//  MemoryLeakSamples
//
//  Created by Sinan on 29.09.2021.
//

import Foundation

class Person{
    var name: String
    weak var car: Car?
    
    init(name: String) {
        self.name = name
    }
    
    deinit{
        print("Person deinit")
    }
}



