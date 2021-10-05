//
//  Case3ViewController.swift
//  MemoryLeakSamples
//
//  Created by Sinan on 29.09.2021.
//

import UIKit

class WithClosure2ViewController: UIViewController {
    
    private let tableView : UITableView = {
        let table = UITableView()
        table.register(Case3TableViewCell.self, forCellReuseIdentifier: Case3TableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }

}

extension WithClosure2ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Case3TableViewCell.identifier, for: indexPath) as! Case3TableViewCell
        // to fix -> add [weak self] or [unowned self] in the capture list.
        cell.buttonTapHandler = {
            self.navigationController?.popViewController(animated: true)
        }
        /*
         cell.buttonTapHandler = { [unowned self] in
             self.navigationController?.popViewController(animated: true)
         }
         */
        return cell
    }
    
}


