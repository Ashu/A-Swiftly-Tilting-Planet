//
//  ViewController.swift
//  Come code with me night 4
//
//  Created by Caleb Wells on 5/23/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let id = "id"
    
    var list = ["Steve", "Tim"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: id)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: id)
        
        cell.textLabel?.text = list[indexPath.row]
        cell.textLabel?.font = .boldSystemFont(ofSize: 27)
        
        cell.detailTextLabel?.text = "Some detail text for testing the detail taxt label in the table view cell."
        cell.detailTextLabel?.numberOfLines = 3
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
}
