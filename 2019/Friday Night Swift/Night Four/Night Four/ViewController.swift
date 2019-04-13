//
//  ViewController.swift
//  Night Four
//
//  Created by Caleb Wells on 4/12/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import UIKit

struct Person: Codable {
    let name: String
    let avatar_url: String
    let bio: String
}

class ViewController: UIViewController {
    
    let image = UIImageView()
    let label = UILabel()
    let url = URL(string: "https://api.github.com/users/calebrwells")!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        setupSubviews()
        fetchSWData()
    }
    
    func fetchSWData() {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                do {
                    let decode = JSONDecoder()
                    let person = try decode.decode(Person.self, from: data)
                    self.label.text = person.name
                    print(person.name)
                    print(person.avatar_url)
                } catch {
                    print("No data")
                }
            }
        }
        
        task.resume()
    }
    
    func setupSubviews() {
        image.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        image.layer.cornerRadius = 12
        image.translatesAutoresizingMaskIntoConstraints = false
        image.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        label.numberOfLines = 0
        
        let stackView = UIStackView(arrangedSubviews: [image, label])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 12
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -40),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
