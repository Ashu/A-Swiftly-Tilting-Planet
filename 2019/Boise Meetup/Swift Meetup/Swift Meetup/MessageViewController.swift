import UIKit
import CloudKit

class MessageViewController: UITableViewController, UITextViewDelegate {
    
    let name = UIDevice.current.name
    
    fileprivate let cellId = "messageCellId"
    var messages = [CKRecord]()
    let refresh = UIRefreshControl()
    let messageTextView = UITextView()

    var bottomConstraint: NSLayoutConstraint?
    var keyboardHeight: CGFloat!

    override func viewWillAppear(_ animated: Bool) {
        addObserver(forName: UIResponder.keyboardWillShowNotification)
        addObserver(forName: UIResponder.keyboardDidShowNotification)
        addObserver(forName: UIResponder.keyboardWillChangeFrameNotification)
        addObserver(forName: UIResponder.keyboardDidChangeFrameNotification)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setupInputComponents()

        refresh.attributedTitle = NSAttributedString(string: "Pull to load new messages!")
        refresh.addTarget(self, action: #selector(loadData), for: .valueChanged)
        self.tableView.addSubview(refresh)

        loadData()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)

        if messages.count == 0 {
            return cell
        }

        let message = messages[indexPath.row]

        if let messageContent = message["content"] as? String {
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "MM/dd"
            let dateString = dateFormat.string(from: message.creationDate!)

            cell.textLabel?.text = messageContent
            cell.textLabel?.numberOfLines = 0
            cell.detailTextLabel?.text = "Sent by \(name), on \(dateString)"
        }

        return cell
    }

    func addObserver(forName: Notification.Name) {
        NotificationCenter.default.addObserver(forName: forName, object: nil, queue: OperationQueue.main) { (note: Notification!) -> Void in print("\(forName): \(String(describing: note))")
        }
    }

    func setupInputComponents() {
        let containerView = UIView()
        containerView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)

        messageTextView.delegate = self
        messageTextView.translatesAutoresizingMaskIntoConstraints = false
        messageTextView.isScrollEnabled = false
        messageTextView.font = .systemFont(ofSize: 16)
        let fixedWidth = messageTextView.frame.size.width
        let newSize = messageTextView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        messageTextView.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        messageTextView.autocorrectionType = .default
        messageTextView.autocapitalizationType = .sentences

        containerView.addSubview(messageTextView)

        let sendButton = UIButton(type: .system)
        sendButton.setTitle("Send", for: .normal)
        sendButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        sendButton.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(sendButton)

        print("\n\nThe height of this view is: \(view.frame.height)\n\n")
        let viewHeight = view.frame.height - 180
        bottomConstraint = containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: viewHeight)
        bottomConstraint!.isActive = true

        NSLayoutConstraint.activate([
            containerView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            //            containerView.heightAnchor.constraint(equalToConstant: 50),
            containerView.widthAnchor.constraint(equalTo: view.widthAnchor),

            sendButton.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            sendButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            sendButton.widthAnchor.constraint(equalToConstant: 80),
            sendButton.heightAnchor.constraint(equalTo: containerView.heightAnchor),

            messageTextView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            messageTextView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            messageTextView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -90),
            messageTextView.heightAnchor.constraint(equalTo: containerView.heightAnchor, constant: -5)
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

    func textViewDidEndEditing(_ textView: UITextView) {
        UIView.animate(withDuration: 0.5) {
            self.bottomConstraint!.constant = CGFloat(self.view.frame.height - 224)
            self.view.layoutIfNeeded()
        }
        textView.resignFirstResponder()
    }

    func textViewShouldReturn(_ textView: UITextView) -> Bool {
        textView.endEditing(true)
        return true
    }

    @objc func sendMessage() {
        if messageTextView.text != "" {
            let newMessage = CKRecord(recordType: "Message")
            newMessage["content"] = messageTextView.text

            let publicData = CKContainer.default().publicCloudDatabase
            publicData.save(newMessage, completionHandler: { (_, error) in
                if error == nil {
                    DispatchQueue.main.async {
                        self.tableView.beginUpdates()
                        self.messages.insert(newMessage, at: 0)
                        let indexPath = IndexPath(row: 0, section: 0)
                        self.tableView.insertRows(at: [indexPath], with: .top)
                        self.tableView.endUpdates()
                    }
                } else {
                    print("Let's make an alert soon...")
                }
            })
            messageTextView.text = ""
            messageTextView.endEditing(true)
        }
    }

    @objc func loadData() {
        messages = [CKRecord]()
        let predicate = NSPredicate(value: true)
        let sortBy = NSSortDescriptor(key: "content", ascending: false)
        let publicData = CKContainer.default().publicCloudDatabase
        let query = CKQuery(recordType: "Message", predicate: predicate)
        query.sortDescriptors = [sortBy]
        publicData.perform(query, inZoneWith: nil) { (results: [CKRecord]?, _) in
            if let messages = results {
                self.messages = messages
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.refresh.endRefreshing()
                }
            }
        }
    }
}
