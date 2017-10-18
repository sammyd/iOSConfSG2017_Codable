//:
//: [<< Encoding](@previous)
//: ---
//:
//: # Decoding JSON

import Foundation

struct Product: Codable {
  private enum CodingKeys: String, CodingKey {
    case id
    case name
    case image_url = "cover_url"
    case url = "relative_url"
    case sku
  }
  
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
  let jsonData = try Data(contentsOf: jsonUrl)
  let decoder = JSONDecoder()
  let products = try decoder.decode([Product].self, from: jsonData)
  print(products)
} catch let error {
  print("There was a problem: \(error)")
}

