//
//  Person.swift
//  MemoryLeakSamples
//
//  Created by Sinan on 29.09.2021.
//

import Foundation

class Person{
    // to fix -> add weak to car object
    var name: String
    var car: Car?
    
    init(name: String) {
        self.name = name
    }
    
    deinit{
        print("Person deinit")
    }
}



