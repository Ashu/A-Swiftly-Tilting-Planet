import UIKit
import PlaygroundSupport

class ViewController: UITableViewController {
    
    let cellId = "cellId"
    
    let list = ["Row 1", "Row 2", "Row 3", "Row 4", "Row 5"]
    
    override func viewDidLoad() {
        navigationItem.title = "Hello, world"
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellId)
        
        cell?.selectionStyle = .none
        
        cell?.textLabel?.text = list[indexPath.row]
        
        let switchObj = UISwitch(frame: CGRect(x: 1, y: 1, width: 20, height: 20))
        switchObj.isOn = false
        switchObj.addTarget(self, action: #selector(toggel), for: .valueChanged)
        cell?.accessoryView = switchObj
        
        return cell!
    }
    
    @objc func toggel() {
        print("Hello, world")
    }
}

let nav = UINavigationController(rootViewController: ViewController())
PlaygroundPage.current.liveView = nav
