//
//  Case5ViewController.swift
//  MemoryLeakSamples
//
//  Created by Sinan on 29.09.2021.
//

import UIKit

class WithNotfCenterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addObservers()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    private func addObservers() {
        
        // to fix -> add [weak self] or [unowned self] in the capture list.
        NotificationCenter.default.addObserver(forName: .ObserveNotification, object: nil, queue: .main) { notification in
            self.handleNotification(notification)
        }
        
/*
        NotificationCenter.default.addObserver(forName: .ObserveNotification, object: nil, queue: .main) { [weak self] notification in
            self?.handleNotification(notification)
        }
 */
        
    }
    
    private func handleNotification(_ notification: Notification) {
        // handler..
    }

}

extension Notification.Name {
    static let ObserveNotification = Notification.Name(rawValue: "ObserveNotification")
}
