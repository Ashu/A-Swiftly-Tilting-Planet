import UIKit

class TabView: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listView = UINavigationController(rootViewController: ListView())
        listView.tabBarItem.image = UIImage(systemName: "film")
        listView.tabBarItem.title = "List"
        
        viewControllers = [
            listView
        ]
    }
}

// make new .swift file!
class ListView: UITableViewController {
    
    let names = ["Steve", "Tim", "Bob", "Jay", "Tom"]
    let id = "id"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "UIKit List"
        navigationController?.navigationBar.prefersLargeTitles = true
                
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: id)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: id)
        
        cell.imageView?.image = UIImage(systemName: "film")
        cell.textLabel?.text = names[indexPath.row]
        cell.detailTextLabel?.text = "subtitle"
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(SomeView(), animated: true)
    }
}

// make new .swift file!
class SomeView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
}
