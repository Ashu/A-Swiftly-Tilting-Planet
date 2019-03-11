//
//  MessageViewController.swift
//  Swift Meetup
//
//  Created by Caleb Wells on 2/25/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import UIKit

class MessageViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
