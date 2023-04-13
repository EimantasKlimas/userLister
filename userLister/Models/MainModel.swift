import Foundation

// MARK: - WelcomeElement
public struct Post: Codable {
    let userId, id: Int
    let title, body: String
}

// MARK: - Welcome
struct UserDetail: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}

public typealias Posts = [Post]
