//
//  ViewController.swift
//  Very simple REST API
//
//  Created by Caleb Wells on 4/16/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

let domainURL = "https://api.sunrise-sunset.org/json?"

class SunsetAndSunrise: Codable {
    
    var sunrise: String?
    var sunset: String?
    
    static func fetch() {
        let urlString = domainURL + "lat=46.144894&lng=-115.977919"
        
        if let url = URL.init(string: urlString) {
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                //print(String.init(data: data!, encoding: .ascii) ?? "no data")
                if let newSunsetAndSunrise = try? JSONDecoder().decode(SunsetAndSunrise.self, from: data!) {
                    print(newSunsetAndSunrise.sunrise ?? "No sunrise")
                }
            })
            task.resume()
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        SunsetAndSunrise.fetch()
    }
}

