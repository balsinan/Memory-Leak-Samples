//
//  Case4ViewController.swift
//  MemoryLeakSamples
//
//  Created by Sinan on 29.09.2021.
//

import UIKit

class WithProtocolViewController: UIViewController {

    private let tableView : UITableView = {
        let table = UITableView()
        table.register(WithProtocolTableViewCell.self, forCellReuseIdentifier: WithProtocolTableViewCell.identifier)
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

extension WithProtocolViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WithProtocolTableViewCell.identifier, for: indexPath) as! WithProtocolTableViewCell
        cell.delegate = self
        return cell
    }
    
}

extension WithProtocolViewController: CustomViewDelegate{
    func didTapButton() {
        self.navigationController?.popViewController(animated: true)
    }
}
