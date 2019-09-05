import UIKit

class ViewController: UIViewController {
    
    var urlString = "https://api.nasa.gov/planetary/apod?api_key=NNKOjkoul8n1CH18TWA9gwngW1s1SmjESPjNoUFo"
    
    let apodImage = UIImageView()
    var navTitle = String()
    var info = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.title = navTitle
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleInfoDisplay))
        
        fetchData()
        setupSubViews()
    }
    
    func setupSubViews() {
        view.addSubview(apodImage)
        apodImage.contentMode = .scaleAspectFit
        apodImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            apodImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            apodImage.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            apodImage.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -60),
            apodImage.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, constant: -60)
        ])
    }
    
    func fetchData() {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let apod = try decoder.decode(APOD.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.title = apod.title
                        self.apodImage.load(url: URL(string: apod.url)!)
                        self.info = apod.explanation

                    }
                    
                } catch {
                    print("catch: \(error)")
                }
            }
        }
        task.resume()
    }
    
    @objc func handleInfoDisplay() {
        let infoView = InfoViewController()
        infoView.infoText.text = info
        navigationController?.pushViewController(infoView, animated: true)
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
