import UIKit
import CloudKit

class MessageViewController: UITableViewController, UITextFieldDelegate {
    
    fileprivate let cellId = "messageCellId"
    let messageTextField = TextField()
    
    var bottomConstraint: NSLayoutConstraint?
    var keyboardHeight: CGFloat!
    //let initialBottomConstraint = 0
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setupInputComponents()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        return cell
    }
    
    func setupInputComponents() {
        let containerView = UIView()
        containerView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        
        messageTextField.delegate = self
        messageTextField.placeholder = "Enter message"
        messageTextField.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(messageTextField)
        
        let sendButton = UIButton(type: .system)
        sendButton.setTitle("Send", for: .normal)
        sendButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        sendButton.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(sendButton)
        
        print("\n\nThe height of this view is: \(view.frame.height)\n\n")
        let viewHeight = view.frame.height - 180
        bottomConstraint = containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: viewHeight)
        bottomConstraint!.isActive = true

        NSLayoutConstraint.activate([
            containerView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            //containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 50),
            containerView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            sendButton.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            sendButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            sendButton.widthAnchor.constraint(equalToConstant: 80),
            sendButton.heightAnchor.constraint(equalTo: containerView.heightAnchor),
            
            messageTextField.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            messageTextField.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            messageTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -90),
            messageTextField.heightAnchor.constraint(equalTo: containerView.heightAnchor)
        ])
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            keyboardHeight = keyboardRectangle.height
            UIView.animate(withDuration: 0.5) {
                self.bottomConstraint!.constant = self.keyboardHeight + 63.5
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.bottomConstraint!.constant = CGFloat(self.view.frame.height - 224)
            self.view.layoutIfNeeded()
        }
        textField.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    @objc func sendMessage() {
        if messageTextField.text != "" {
            let newMessage = CKRecord(recordType: "Message")
            newMessage["content"] = messageTextField.text
            
            let publicData = CKContainer.default().publicCloudDatabase
            publicData.save(newMessage, completionHandler: { (record, error) in
                if error == nil {
                    print("Message saved.")
                } else {
                    print("Let's make an alert soon...")
                }
            })
            messageTextField.text = ""
        }
    }
}
