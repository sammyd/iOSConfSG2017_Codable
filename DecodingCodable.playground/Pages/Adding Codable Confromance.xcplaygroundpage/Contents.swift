//: [Previous](@previous)

import UIKit

extension UIColor: Encodable {
  public func encode(to encoder: Encoder) throws {
    var container = encoder.unkeyedContainer()
    var colour: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) = (0, 0, 0, 0)
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
}

let julie = Person(name: "julie", age: 43, favouriteColour: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))

let encoder = JSONEncoder()
let jsonData = try! encoder.encode(julie)

String(bytes: jsonData, encoding: .utf8)

//: [Next](@next)
