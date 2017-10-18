//:
//: [<< Encoding](@previous)
//: ---
//:
//: # Decoding JSON

import Foundation

struct Product: Codable {
  let id: Int
  let name: String
  let image_url: URL
  let url: URL
  let sku: String
}

guard let jsonUrl = Bundle.main.url(forResource: "products", withExtension: "json") else { fatalError() }

do {
  
} catch let error {
  print("There was a problem: \(error)")
}

