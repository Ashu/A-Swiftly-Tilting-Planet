//
//  ViewController.swift
//  Night Two
//
//  Created by Caleb Wells on 3/15/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    /// The is the cell id
    private let cellId = "cellID"
    var cellItems = ["Item 01", "Item 02"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        navigationItem.title = "Night Two"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddButton))
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.textLabel?.text = cellItems[indexPath.row]
        
        return cell
    }
    
    // MARK: - Handle buttons. -
    @objc func handleAddButton() {
        cellItems.append("New item")
        
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .top)
        tableView.reloadData()
        tableView.endUpdates()
    }
}
