import UIKit

class APIManager {
    static let shared = APIManager()
    private let baseUrl = "https://rickandmortyapi.com/api"
    private let postEndPoint = "/character"
    private let lastEndPoint = "/episode"
    
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
    

    
    func getEpisodes(from urlString: String, completion: @escaping(Episode?) -> Void) {
        guard let url = URL(string: urlString) else { return }

        let taskEpisode = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
              
                completion(nil)
                return
            }

            guard let data = data else {
                print("No data returned")
                completion(nil)
                return
            }
            

            do {
                let posts = try JSONDecoder().decode(Episode.self, from: data)
                completion(posts)
                
            } catch let jsonError {
                print("Error decoding JSON: \(jsonError)")
                completion(nil)
            }
        }
        taskEpisode.resume()
    }

}
