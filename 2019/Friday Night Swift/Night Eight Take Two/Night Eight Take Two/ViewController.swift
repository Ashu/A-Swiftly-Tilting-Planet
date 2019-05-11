//
//  ViewController.swift
//  Night Eight Take Two
//
//  Created by Caleb Wells on 5/10/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let cellID = "id"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        view.backgroundColor = #colorLiteral(red: 0.1605761051, green: 0.1642630696, blue: 0.1891490221, alpha: 1)
        
        tableView.tableFooterView = UIView()
        tableView.separatorColor = #colorLiteral(red: 0.9984027743, green: 0.3513903022, blue: 0.3220958412, alpha: 1)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    func setupNavigation() {
        navigationItem.title = "Some App"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.9984027743, green: 0.3513903022, blue: 0.3220958412, alpha: 1)]
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.9984027743, green: 0.3513903022, blue: 0.3220958412, alpha: 1)]
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2272783816, green: 0.2311799526, blue: 0.2436174154, alpha: 1)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        cell.textLabel?.textColor = #colorLiteral(red: 0.9984027743, green: 0.3513903022, blue: 0.3220958412, alpha: 1)
        cell.textLabel?.text = "What about full stack Swift videos?"
        cell.backgroundColor = #colorLiteral(red: 0.1605761051, green: 0.1642630696, blue: 0.1891490221, alpha: 1)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = DetailViewController()
        navigationController?.pushViewController(detailView, animated: true)
    }
}

class DetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.9984027743, green: 0.3513903022, blue: 0.3220958412, alpha: 1)
        view.backgroundColor = #colorLiteral(red: 0.9022161365, green: 0.7540545464, blue: 0.162062794, alpha: 1)
    }
}
