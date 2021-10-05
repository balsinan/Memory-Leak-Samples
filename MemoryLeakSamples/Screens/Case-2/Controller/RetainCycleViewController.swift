//
//  Case2ViewController.swift
//  MemoryLeakSamples
//
//  Created by Sinan on 29.09.2021.
//

import UIKit

class RetainCycleViewController: UIViewController {
    
    var owner: Person?
    var car: Car?

    override func viewDidLoad() {
        super.viewDidLoad()

        owner = Person(name: "Sinan")
        car = Car(name: "Audi")
        
        car?.owner = owner
        owner?.car = car
    }
    
    deinit {
        print("Case2ViewController deinit")
    }

}
