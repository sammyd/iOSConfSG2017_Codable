import UIKit

enum Relation: String, Codable {
  case mum
  case dad
}

extension UIColor: Encodable {
  public func encode(to encoder: Encoder) throws {
    enum ColourKeys: CodingKey {
      case red
      case green
      case blue
      case alpha
    }
    
    var container = encoder.container(keyedBy: ColourKeys.self)
    var colour : (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) = (0, 0, 0, 0)
    getRed(&colour.r, green: &colour.g, blue: &colour.b, alpha: &colour.a)
    try container.encode(colour.r, forKey: .red)
    try container.encode(colour.g, forKey: .green)
    try container.encode(colour.b, forKey: .blue)
    try container.encode(colour.a, forKey: .alpha)
  }
}

//extension UIColor: Decodable {
//  public required init(from decoder: Decoder) throws {
//    // No good—can't put a required initialiser in an extension
//  }
//}

class MyColor: UIColor, Decodable {
  required init(from decoder: Decoder) {

  }
  
  required init(_colorLiteralRed red: Float, green: Float, blue: Float, alpha: Float) {
    fatalError("init(_colorLiteralRed:green:blue:alpha:) has not been implemented")
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
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

