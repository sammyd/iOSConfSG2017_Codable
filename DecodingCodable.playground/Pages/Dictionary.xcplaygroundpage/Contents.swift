//: [Previous](@previous)

import Foundation

let dict = [
  "people": 24,
  "cars": 6,
  "cats": 18
]

let encoder = JSONEncoder()
let encoded = try! encoder.encode(dict)

let jsonString = String(bytes: encoded, encoding: .utf8)

let decoder = JSONDecoder()
let decoded = try! decoder.decode([String : Int].self, from: encoded)


//: [Next](@next)
