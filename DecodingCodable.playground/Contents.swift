import UIKit

let str = "A string"

let encoder = JSONEncoder()
let data = try! encoder.encode([str])

let jsonString = String(bytes: data, encoding: .utf8)

let decoder = JSONDecoder()
try! decoder.decode([String].self, from: data)

