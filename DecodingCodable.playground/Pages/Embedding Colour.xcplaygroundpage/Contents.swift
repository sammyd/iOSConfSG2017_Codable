//: [Previous](@previous)

import UIKit

struct Colour: Codable {
  let red, green, blue, alpha: CGFloat
  
  init(from colour: UIColor) {
    var cmpts : (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) = (0, 0, 0, 0)
    colour.getRed(&cmpts.r, green: &cmpts.g, blue: &cmpts.b, alpha: &cmpts.a)
    red = cmpts.r
    green = cmpts.g
    blue = cmpts.b
    alpha = cmpts.a
  }
  
  var uiColor: UIColor {
    return UIColor(red: red, green: green, blue: blue, alpha: alpha)
  }
}

struct Person: Codable {
  let name: String
  let age: Int
  let favouriteColour: Colour
}

let julie = Person(name: "julie", age: 43, favouriteColour: Colour(from: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)))

let encoder = JSONEncoder()
let jsonData = try! encoder.encode(julie)

let jsonString = String(bytes: jsonData, encoding: .utf8)

let decoder = JSONDecoder()
let decoded = try! decoder.decode(Person.self, from: jsonData)
decoded.favouriteColour.uiColor

//: [Next](@next)
