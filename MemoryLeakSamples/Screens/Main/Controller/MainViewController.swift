//
//  MainViewController.swift
//  MemoryLeakSamples
//
//  Created by Sinan on 29.09.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    private let tableView : UITableView = {
        let table = UITableView()
        table.register(SamplesTableViewCell.self, forCellReuseIdentifier: SamplesTableViewCell.identifier)
        return table
    }()
    
    var itemArray = ["With Closure", "Retain Cycle", "With Closure", "Protocol", "With Notification Center"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds

    }

}

extension MainViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SamplesTableViewCell.identifier, for: indexPath) as! SamplesTableViewCell
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let destVc = WithClosureViewController()
            navigationController?.pushViewController(destVc, animated: true)
        case 1:
            let destVc = RetainCycleViewController()
            navigationController?.pushViewController(destVc, animated: true)
        case 2:
            let destVc = WithClosure2ViewController()
            navigationController?.pushViewController(destVc, animated: true)
        case 3:
            let destVc = WithProtocolViewController()
            navigationController?.pushViewController(destVc, animated: true)
        case 4:
            let destVc = WithNotfCenterViewController()
            navigationController?.pushViewController(destVc, animated: true)
        default:
            break
        }
    }
}



