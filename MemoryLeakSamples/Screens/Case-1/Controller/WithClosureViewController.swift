//
//  Case1ViewController.swift
//  MemoryLeakSamples
//
//  Created by Sinan on 29.09.2021.
//

import UIKit

class Case1ViewController: UIViewController {

    let customView = CustomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCustomView()
    }
    
    func setupCustomView(){
        customView.frame = CGRect(x: 100, y: 200, width: (self.view.frame.width-200), height: (self.view.frame.height-400))
        view.addSubview(customView)
        // to fix -> add [weak self] or [unowned self] in the capture list.
        customView.tapHandler = { 
            self.navigationController?.popViewController(animated: true)
        }
        
        /*
         customView.tapHandler = { [unowned self] in
             self.navigationController?.popViewController(animated: true)
         }
         */
    }
}

