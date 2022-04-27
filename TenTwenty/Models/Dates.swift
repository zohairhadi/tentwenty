// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dates = try? newJSONDecoder().decode(Dates.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.datesTask(with: url) { dates, response, error in
//     if let dates = dates {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseDates { response in
//     if let dates = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - Dates
struct Dates: Codable {
    let maximum, minimum: String
}
