import UIKit

let dict = [
  "people": 24,
  "cats": 6,
  "cars": 16
]

let encoder = JSONEncoder()
let data = try! encoder.encode(dict)

let jsonString = String(bytes: data, encoding: .utf8)

let decoder = JSONDecoder()
try! decoder.decode([String : Int].self, from: data)

