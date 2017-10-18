import UIKit

struct Person: Codable {
  let name: String
  let age: Int
  let favouriteColour: String
  let relations: [String: String]
}

let julie = Person(name: "julie", age: 43, favouriteColour: "orange", relations: ["mum": "Lucy", "dad": "Peter"])

let encoder = JSONEncoder()
let data = try! encoder.encode(julie)

let jsonString = String(bytes: data, encoding: .utf8)

let decoder = JSONDecoder()
try! decoder.decode(Person.self, from: data)

