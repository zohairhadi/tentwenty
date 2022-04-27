// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(UpcomingMovies.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.welcomeTask(with: url) { welcome, response, error in
//     if let welcome = welcome {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseWelcome { response in
//     if let welcome = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - UpcomingMovies
struct UpcomingMovies: Codable {
    let dates: Dates
    let page: Int
    let results: [Result]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
