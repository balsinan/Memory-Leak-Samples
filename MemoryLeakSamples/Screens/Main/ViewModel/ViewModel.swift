//
//  ViewModel.swift
//  MemoryLeakSamples
//
//  Created by Sinan on 16.09.2022.
//

import Foundation
import UIKit

class MainViewModel{
    
    var items = ["With Closure", "Retain Cycle", "With Closure", "Protocol", "With Notification Center"]

    init() {
        
    }

    func numberOfRowsInSection() -> Int{
        return items.count
    }

    func cellForRowAt(index: Int) -> String{
        return items[index]
    }
    
    func didSelectRowAt(index: Int) -> UIViewController{
        switch index {
        case 0:
            return WithClosureViewController()
        case 1:
            return RetainCycleViewController()
        case 2:
            return WithClosure2ViewController()
        case 3:
            return WithProtocolViewController()
        case 4:
            return WithNotfCenterViewController()
        default:
            return UIViewController()
        }
    }

}
