import Foundation


struct PersonElement: Codable {
    let results: [Person]
}

// MARK: - Result
struct Person: Codable {
    let id: Int
    let name: String
    let type: String
    let image: String
    let url: String
    let created: String
    let species: Species
    let status: Status
    let gender: Gender
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}


enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}
