//:
//: [<< Encoding](@previous)
//: ---
//:
//: # Decoding JSON

import Foundation

struct Product: Codable {
  let id: Int
  let name: String
  let image_url: URL?
  let url: URL?
  let sku: String
}

extension Product: CustomPlaygroundQuickLookable {
  var customPlaygroundQuickLook: PlaygroundQuickLook {
    return .text("\(sku) :: \(name)")
  }
}

guard let jsonUrl = Bundle.main.url(forResource: "products", withExtension: "json") else { fatalError() }

do {
  // TODO
} catch let error {
  print("There was a problem: \(error)")
}

