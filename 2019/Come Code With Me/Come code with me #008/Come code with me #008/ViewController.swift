//
//  ViewController.swift
//  Come code with me #008
//
//  Created by Caleb Wells on 5/27/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let id = "id"
    let footerView = FooterView()
    
    let todoItem = String()
    var todo = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        navigationItem.title = "To do list"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddItems))
        
        tableView.tableFooterView = footerView.view
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: id)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
        
        cell.textLabel?.text = todo[indexPath.row]
        
        cell.accessoryType = .checkmark
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todo.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .right)
            hideFooterText()
        } else {
            print("Not editing?")
        }
    }
    
    @objc func handleAddItems() {
        addItem()
        
//        todo.append(todoItem)
//        tableView.reloadData()
        hideFooterText()
    }
    
    func addItem() {
        let ac = UIAlertController(title: "Add a new item", message: nil, preferredStyle: .alert)
        
        ac.addTextField { (textField) in
            textField.placeholder = "Add a new item"
            
        }
        
        let addButton = UIAlertAction(title: "Add", style: .default) { _ in
            self.tableView.reloadData()
            print(self.todo)
            self.dismiss(animated: true, completion: nil)
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            self.dismiss(animated: true, completion: nil)
        }
        
        ac.addAction(addButton)
        ac.addAction(cancelButton)
        present(ac, animated: true)
    }
    
    func hideFooterText() {
        if todo.count > 0 {
            footerView.footerLabel.isHidden = true
        } else {
            footerView.footerLabel.isHidden = false
        }
    }
}


// MARK: - Move this to a new .swift file at point.
class FooterView: UIViewController {
    
    let footerLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    func setupLayout() {
        footerLabel.text = "Tap the + button to get started!"
        footerLabel.font = .boldSystemFont(ofSize: 18)
        footerLabel.textColor = #colorLiteral(red: 0, green: 0.4793452024, blue: 0.9990863204, alpha: 1)
        footerLabel.textAlignment = .center
        footerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(footerLabel)
        
        NSLayoutConstraint.activate([
            footerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            footerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            footerLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100)
        ])
    }
}
