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
}
