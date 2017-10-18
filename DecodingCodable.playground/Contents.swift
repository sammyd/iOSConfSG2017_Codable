import UIKit

enum Relation: String, Codable {
  case mum
  case dad
}

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
  let relations: [Relation: String]
}

let julie = Person(name: "julie", age: 43, favouriteColour: Colour(from: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)), relations: [.mum: "Lucy", .dad: "Peter"])

let encoder = JSONEncoder()
let data = try! encoder.encode(julie)

let jsonString = String(bytes: data, encoding: .utf8)

let decoder = JSONDecoder()
let decodedPerson = try! decoder.decode(Person.self, from: data)
decodedPerson.favouriteColour.uiColor
