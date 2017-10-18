//: [Previous](@previous)

import UIKit

extension UIColor {
  
}

struct Person: Encodable {
  let name: String
  let age: Int
  let favouriteColour: UIColor
}

let julie = Person(name: "julie", age: 43, favouriteColour: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))

let encoder = JSONEncoder()
let jsonData = try! encoder.encode(julie)


//: [Next](@next)
