import UIKit

let key = "436289a8bb472221d43d4387e548349e"
let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=London&APPID=\(key)")!

print(url.query as Any)
print(url.absoluteString)

let decoder = JSONDecoder()

let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    if let data = data,
    let jsonDictionary = try? decoder.decode([String: String].self, from: data) {
        print(jsonDictionary)
    }
}

task.resume()

struct WeatherInfo {
    var id: Int
    var main: String
    var description: String
    var icon: String
}
