import UIKit

enum Relation: String, Codable {
  case mum
  case dad
}

extension UIColor: Encodable {
  public func encode(to encoder: Encoder) throws {
    var container = encoder.unkeyedContainer()
    var colour : (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) = (0, 0, 0, 0)
    getRed(&colour.r, green: &colour.g, blue: &colour.b, alpha: &colour.a)
    try container.encode(colour.r)
    try container.encode(colour.g)
    try container.encode(colour.b)
    try container.encode(colour.a)
  }
}

struct Person: Encodable {
  let name: String
  let age: Int
  let favouriteColour: UIColor
  let relations: [Relation: String]
}

let julie = Person(name: "julie", age: 43, favouriteColour: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), relations: [.mum: "Lucy", .dad: "Peter"])

let encoder = JSONEncoder()
let data = try! encoder.encode(julie)

let jsonString = String(bytes: data, encoding: .utf8)

//let decoder = JSONDecoder()
//try! decoder.decode(Person.self, from: data)

