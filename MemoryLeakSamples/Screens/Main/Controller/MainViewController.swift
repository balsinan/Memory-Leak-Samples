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
    
    var viewModel = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }

}

extension MainViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SamplesTableViewCell.identifier, for: indexPath) as! SamplesTableViewCell
        cell.textLabel?.text = viewModel.cellForRowAt(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destcVC = viewModel.didSelectRowAt(index: indexPath.row)
        navigationController?.pushViewController(destcVC, animated: true)
    }
}



