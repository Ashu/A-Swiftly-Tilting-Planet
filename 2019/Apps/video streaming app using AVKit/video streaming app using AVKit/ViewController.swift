//
//  ViewController.swift
//  video streaming app using AVKit
//
//  Created by Caleb Wells on 4/30/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

struct Video {
    let name: String
    let url: String
}

class ViewController: UITableViewController {
    
    let videos = [
        Video(name: "Night of the Living Dead", url: "https://archive.org/download/night_of_the_living_dead/night_of_the_living_dead.mp4"),
        Video(name: "Plan 9 from Outer Space", url: "https://archive.org/download/Plan_9_from_Outer_Space_1959/Plan_9_from_Outer_Space_1959.mp4")
    ]
    
    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Basic Video App"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        cell.textLabel?.text = videos[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: videos[indexPath.row].url) else { return }
        
        let player = AVPlayer(url: url)
        let controller = AVPlayerViewController()
        controller.player = player
        
        present(controller, animated: true)
    }
}
