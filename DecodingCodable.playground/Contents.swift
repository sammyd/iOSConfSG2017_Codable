import UIKit

struct Person: Codable {
  let name: String
  let age: Int
  let favouriteColour: String
}

let julie = Person(name: "julie", age: 43, favouriteColour: "orange")

let encoder = JSONEncoder()
let data = try! encoder.encode(julie)

let jsonString = String(bytes: data, encoding: .utf8)

let decoder = JSONDecoder()
try! decoder.decode(Person.self, from: data)

