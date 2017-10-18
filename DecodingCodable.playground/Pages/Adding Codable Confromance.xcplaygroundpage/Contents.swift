//: [Previous](@previous)

import UIKit

extension UIColor: Encodable {
  public func encode(to encoder: Encoder) throws {
    enum ColourKeys: CodingKey {
      case red
      case green
      case blue
      case alpha
    }
    
    var container = encoder.container(keyedBy: ColourKeys.self)
    var colour: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) = (0, 0, 0, 0)
    getRed(&colour.r, green: &colour.g, blue: &colour.b, alpha: &colour.a)
    try container.encode(colour.r, forKey: .red)
    try container.encode(colour.g, forKey: .green)
    try container.encode(colour.b, forKey: .blue)
    try container.encode(colour.a, forKey: .alpha)
  }
}

//extension UIColor: Decodable {
//
//}

class MyColour : UIColor {
  init(decoder: Decoder) {
    // TODO
  }
  
  @nonobjc required convenience init(_colorLiteralRed red: Float, green: Float, blue: Float, alpha: Float) {
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
}

let julie = Person(name: "julie", age: 43, favouriteColour: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))

let encoder = JSONEncoder()
let jsonData = try! encoder.encode(julie)

String(bytes: jsonData, encoding: .utf8)

//: [Next](@next)
