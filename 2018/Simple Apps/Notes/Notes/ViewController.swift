import UIKit

class ViewController: UITableViewController {
    
    let cellId = "cellId"
    
    var data = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Notes"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let addRowButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addRow))
        navigationItem.rightBarButtonItem = addRowButton
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellId)
        
        cell?.selectionStyle = .none
        cell?.textLabel?.text = data[indexPath.row]
        cell?.accessoryType = .disclosureIndicator
        
        return cell!
    }
    
    @objc func addRow() {
        let name = "Item \(data.count + 1)"
        data.insert(name, at: 0)
        
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .left)
    }
}
