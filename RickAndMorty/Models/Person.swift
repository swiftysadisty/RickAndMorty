import Foundation

struct Person: Identifiable {
    let id = UUID()
    var name: String
    var image: String
}
