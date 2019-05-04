import UIKit

var url = URL(string: "https://ghibliapi.herokuapp.com/films")

struct Film: Decodable {
    let title: String
    let description: String
    let director: String
    let producer: String
    let releaseDate: String
}

func fetchFilms() {
    guard let url = url else { return }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if error == nil {
//            let stringFromData = String(decoding: data!, as: UTF8.self)
//            print(stringFromData)
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let film = try decoder.decode([Film].self, from: data!)
                print(film[0])
            } catch {
                print("🤬")
            }
            
        } else {
            print("🤬")
        }
    }
    
    task.resume()
}

fetchFilms()
