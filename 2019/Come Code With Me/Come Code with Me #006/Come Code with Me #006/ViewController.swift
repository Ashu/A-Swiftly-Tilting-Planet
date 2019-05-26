//
//  ViewController.swift
//  Come Code with Me #006
//
//  Created by Caleb Wells on 5/25/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let welcomeImage = UIImageView(image: #imageLiteral(resourceName: "donut"))
    let welcomeLabel = UILabel()
    let detailWelcomeLabel = UILabel()
    let nextViewButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        navigationController?.isNavigationBarHidden = true
        
        setupLayout()
    }
    
    func setupLayout() {
        welcomeImage.contentMode = .scaleAspectFit
        welcomeLabel.text = "Welcome to the App"
        welcomeLabel.textColor = #colorLiteral(red: 0.9461947083, green: 0.4151232839, blue: 0.4416619241, alpha: 1)
        welcomeLabel.font = .boldSystemFont(ofSize: 34)
        detailWelcomeLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus facilisis egestas elit, et accumsan dolor pellentesque in. Quisque egestas velit felis, id ultrices diam iaculis non. Maecenas et consectetur lacus. Vivamus dictum nulla a metus sagittis scelerisque. Aliquam ullamcorper porta consectetur."
        detailWelcomeLabel.numberOfLines = 0
        
        let welcomeStackView = UIStackView(arrangedSubviews: [welcomeImage, welcomeLabel, detailWelcomeLabel])
        welcomeStackView.axis = .vertical
        welcomeStackView.setCustomSpacing(24, after: welcomeLabel)
        welcomeStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeStackView)
        
        nextViewButton.setTitle("Next", for: .normal)
        nextViewButton.setTitleColor(#colorLiteral(red: 0.9461947083, green: 0.4151232839, blue: 0.4416619241, alpha: 1), for: .normal)
        nextViewButton.titleLabel?.font = .boldSystemFont(ofSize: 27)
        nextViewButton.backgroundColor = #colorLiteral(red: 0.9926748872, green: 0.818700552, blue: 0.5471376181, alpha: 1)
        nextViewButton.layer.cornerRadius = 12
        nextViewButton.addTarget(self, action: #selector(handleNextViewPush), for: .touchUpInside)
        nextViewButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nextViewButton)
        
        NSLayoutConstraint.activate([
            welcomeStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            welcomeStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -100),
            welcomeStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            welcomeStackView.heightAnchor.constraint(equalToConstant: 512),
            
            nextViewButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -100),
            nextViewButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            nextViewButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            nextViewButton.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
    
    @objc func handleNextViewPush() {
        let vc = UINavigationController(rootViewController: List())
        present(vc, animated: true)
    }
}




// MARK: - Put this in a new .swift file
class List: UITableViewController {
    
    let id = "id"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "List View"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: id)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: id)
        
        let img = UIImageView(image: #imageLiteral(resourceName: "donut image"))
        
        cell.imageView?.image = img.image
        
        cell.textLabel?.text = "Donut Label"
        cell.textLabel?.font = .boldSystemFont(ofSize: 27)
        
        cell.detailTextLabel?.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus facilisis egestas elit, et accumsan dolor pellentesque in. Quisque egestas velit felis, id ultrices diam iaculis non. Maecenas et consectetur lacus."
        cell.detailTextLabel?.numberOfLines = 0
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
}
