import UIKit

class APIManager {
    static let shared = APIManager()
    private let baseUrl = "https://rickandmortyapi.com/api"
    private let postEndPoint = "/character"
    private var images = UIImageView()
    
    func getPosts(complition: @escaping(PersonElement) -> Void) {
        guard let url: URL = URL(string: baseUrl + postEndPoint) else { return }
        let request: URLRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            
            if let posts = try? JSONDecoder().decode(PersonElement.self, from: data) {
                complition( posts )
                
            } else {
                print(error)
            }
        }
        task.resume()
    }
    
    func getImage(from urlString: String, completion: @escaping(UIImage?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        let taskImage = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            let image = UIImage(data: data)
            completion(image)
        }
        taskImage.resume()
    }
}
