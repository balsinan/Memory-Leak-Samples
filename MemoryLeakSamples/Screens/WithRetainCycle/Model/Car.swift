//
//  Car.swift
//  MemoryLeakSamples
//
//  Created by Sinan on 29.09.2021.
//

import Foundation

class Car{
    var name: String
    var owner: Person?
    
    init(name: String) {
        self.name = name
    }
    
    deinit{
        print("Car deinit")
    }
    
}
