//
//  FilmListViewController.swift
//  Night Seven Studio Ghibli API
//
//  Created by Caleb Wells on 5/3/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import UIKit

class FilmListViewController: UITableViewController {
    
    var url = URL(string: "https://ghibliapi.herokuapp.com/films")
    
    let cellID = "cellID"
    var filmList = [Film]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFilms()
        
        navigationItem.title = "Studio Ghibli Films"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        cell.textLabel?.text = filmList[indexPath.row].title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = FilmViewController()
        vc.filmDetails.append(filmList[indexPath.row].title)
        vc.filmDetails.append("Description\n\n\(filmList[indexPath.row].description)")
        vc.filmDetails.append("Director: \(filmList[indexPath.row].director)")
        vc.filmDetails.append("Producer: \(filmList[indexPath.row].producer)")
        vc.filmDetails.append("Release date: \(filmList[indexPath.row].releaseDate)")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: Get films!
    func fetchFilms() {
        guard let url = url else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error == nil {
                DispatchQueue.main.async {
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let films = try decoder.decode([Film].self, from: data!)
                        
                        self.filmList = films
                        self.tableView.reloadData()
                    } catch {
                        print("🤬")
                    }
                }
            } else {
                print("🤬")
            }
        }
        
        task.resume()
    }
}
