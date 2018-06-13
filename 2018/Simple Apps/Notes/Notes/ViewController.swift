import UIKit

class ViewController: UITableViewController {
    
    let cellId = "cellId"
    let notes = "notes"
    
    var data = [String]()
    var selectedRow = -1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Notes"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let addRowButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addRow))
        navigationItem.rightBarButtonItem = addRowButton
        navigationItem.leftBarButtonItem = editButtonItem
        
        loadList()
        
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .right)
        }
        
        saveList()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let notesVC = NotesViewController()
        selectedRow = tableView.indexPathForSelectedRow!.row
        notesVC.setText(data[selectedRow])
        navigationController?.pushViewController(notesVC, animated: true)
        
        print("\(data[indexPath.row])")
    }
    
    @objc func addRow() {
        if tableView.isEditing {
            return
        }
        
        let name = "Item \(data.count + 1)"
        data.insert(name, at: 0)
        
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .left)
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        
        saveList()
    }
    
    func saveList() {
        UserDefaults.standard.set(data, forKey: notes)
    }
    
    func loadList() {
        if let loadedData: [String] = UserDefaults.standard.value(forKey: notes) as? [String] {
            data = loadedData
            tableView.reloadData()
        }
    }
}
