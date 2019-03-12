import UIKit
import CloudKit

class MessageViewController: UITableViewController {
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(sendMessage))
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.textLabel?.text = "Hello, cell!"
        
        return cell
    }
    
    @objc func sendMessage() {
        print("Message sent!")
        let messageAlert = UIAlertController(title: "New Message", message: nil, preferredStyle: .alert)
        messageAlert.addTextField { (textField: UITextField) in
            textField.placeholder = "Enter a new message."
        }
        
        messageAlert.addAction(UIAlertAction(title: "Send", style: .default, handler: { (action: UIAlertAction) in
            let messageTextField = messageAlert.textFields!.first!
            
            if messageTextField.text != "" {
                let newMessage = CKRecord(recordType: "Message")
                newMessage["content"] = messageTextField.text
                
                let publicData = CKContainer.default().publicCloudDatabase
                publicData.save(newMessage, completionHandler: { (record, error) in
                    if error == nil {
                        print("Message saved.")
                    }
                })
            }
        }))
        
        messageAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(messageAlert, animated: true, completion: nil)
    }
}
