//
//  FilmViewController.swift
//  Night Seven Studio Ghibli API
//
//  Created by Caleb Wells on 5/3/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import UIKit

class FilmViewController: UITableViewController {
    
    let cellID = "id"
    var filmDetails = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmDetails.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        if indexPath.row == 0 {
            cell.textLabel?.font = .boldSystemFont(ofSize: 27)
        }
        
        cell.textLabel?.text = filmDetails[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
}
