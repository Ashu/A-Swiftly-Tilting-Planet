import UIKit

struct PhotoInfo: Codable {
    var title: String
    var description: String
    var url: String
    var copyright: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case description = "explanation"
        case url
        case copyright
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try valueContainer.decode(String.self, forKey: CodingKeys.title)
        self.description = try valueContainer.decode(String.self, forKey: CodingKeys.description)
        self.url = try valueContainer.decode(String.self, forKey: CodingKeys.url)
        self.copyright = try valueContainer.decode(String.self, forKey: CodingKeys.copyright)
    }
}


extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}

func fetchPhotoInfo(completion: @escaping (PhotoInfo) -> Void) {
    let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
    
    let query: [String: String] = [
        "api_key": "DEMO_KEY",
        ]
    
    let url = baseURL.withQueries(query)!
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        let decoder = JSONDecoder()
        
        //if let data = data,
        let photoInfo = try! decoder.decode(PhotoInfo.self, from: data!) //{
        completion(photoInfo)
        //}
    }
    
    task.resume()
}

fetchPhotoInfo { (fetchedInfo) in
    print(fetchedInfo)
}
