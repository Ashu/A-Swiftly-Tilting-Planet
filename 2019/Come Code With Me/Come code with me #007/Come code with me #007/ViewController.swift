//
//  ViewController.swift
//  Come code with me #007
//
//  Created by Caleb Wells on 5/26/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let cardView = UIView()
    let headerLabel = UILabel()
    let cardText = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        makeCardView()
    }
    
    func makeCardView() {
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        leftSwipeGesture.direction = .left
        
        cardView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        cardView.layer.cornerRadius = 12
        cardView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cardView.layer.shadowRadius = 12
        cardView.layer.shadowOpacity = 0.4
        cardView.layer.shadowOffset = CGSize(width: 0, height: 12)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.addGestureRecognizer(rightSwipeGesture)
        cardView.addGestureRecognizer(leftSwipeGesture)
        view.addSubview(cardView)
        
        let containerView = UIView()
        containerView.layer.cornerRadius = 12
        containerView.layer.masksToBounds = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(containerView)
        
        let header = UIView()
        header.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        header.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(header)
        
        headerLabel.text = "Hello, world"
        headerLabel.font = .boldSystemFont(ofSize: 18)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        header.addSubview(headerLabel)
        
        cardText.text = ""
        cardText.numberOfLines = 0
        cardText.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(cardText)
        
        NSLayoutConstraint.activate([
            cardView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -100),
            cardView.heightAnchor.constraint(equalToConstant: 400),
            
            containerView.topAnchor.constraint(equalTo: cardView.topAnchor),
            containerView.widthAnchor.constraint(equalTo: cardView.widthAnchor),
            containerView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor),
            
            header.topAnchor.constraint(equalTo: containerView.topAnchor),
            header.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            header.heightAnchor.constraint(equalToConstant: 64),
            
            headerLabel.centerYAnchor.constraint(equalTo: header.centerYAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 12),
            
            cardText.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 76),
            cardText.widthAnchor.constraint(equalTo: cardView.widthAnchor, constant: -24),
            cardText.centerXAnchor.constraint(equalTo: cardView.centerXAnchor)
        ])
    }
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        if sender.direction == .right {
            headerLabel.text = "Hello, Swipe Right"
            fetchJobs()
        } else if sender.direction == .left {
            headerLabel.text = "Hello, Swipe Left"
        }
    }
    
    
    
    // MARK: - The GitHub Jobs API
    let url = URL(string: "https://jobs.github.com/positions.json?description=ios&location=new+york")!
    
    func fetchJobs() {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let jobPostings = try decoder.decode([Job].self, from: data)
                    
                    DispatchQueue.main.async {
                        self.headerLabel.text = jobPostings[0].title
                        self.cardText.text = jobPostings[0].location
                        print(jobPostings.count)
                    }
                } catch {
                    print("Failed...")
                }
            } else {
                print("No data")
            }
        }
        
        task.resume()
    }
}

struct Job: Decodable {
    let title: String
    let type: String
    let createdAt: String
    let company: String
    let location: String
    let description: String
}
