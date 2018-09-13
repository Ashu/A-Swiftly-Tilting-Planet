import UIKit

let url = URL(string: "https://apple.com")!

let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    if let data = data {
        let string = String(data: data, encoding: .utf8)
        print(string)
    }
}

task.resume()
