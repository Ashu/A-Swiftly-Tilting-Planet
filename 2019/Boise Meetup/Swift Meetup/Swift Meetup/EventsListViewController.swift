import UIKit
import CloudKit

class EventListViewController: UITableViewController {
    
    fileprivate let cellId = "eventCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentCreateEventView))
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.textLabel?.text = "New event!"
        
        return cell
    }
    
    @objc func presentCreateEventView() {
        print("New ")
        let createView = UINavigationController(rootViewController: CreateEventViewController())
        present(createView, animated: true, completion: nil)
    }
}
