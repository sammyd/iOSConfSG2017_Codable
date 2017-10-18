//: # Encoding JSON

import UIKit

let str = "My String"

let encoder = JSONEncoder()
let jsonData = try! encoder.encode([str])

let jsonString = String(bytes: jsonData, encoding: .utf8)

let decoder = JSONDecoder()
let decoded = try! decoder.decode([String].self, from: jsonData)


//: ---
//: [Decoding >>](@next)

