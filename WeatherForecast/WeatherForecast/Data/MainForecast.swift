// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct ForecastWeatherResponse: Codable {
    var city: City?
    var cod: String?
    var message: Double?
    var cnt: Int?
    var list: [List]?
}

// MARK: - City
struct City: Codable {
    var id: Int?
    var name: String?
    var coord: Coord?
    var country: String?
    var population, timezone: Int?
}

// MARK: - Coord
struct Coord: Codable {
    var lon, lat: Double?
}

// MARK: - List
struct List: Codable {
    var dt, sunrise, sunset: Int?
    var temp: Temp?
    var feelsLike: FeelsLike?
    var pressure, humidity: Int?
    var weather: [Weather]?
    var speed: Double?
    var deg, clouds: Int?
    var rain: Double?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity, weather, speed, deg, clouds, rain
    }
}

// MARK: - FeelsLike
struct FeelsLike: Codable {
    var day, night, eve, morn: Double?
}

// MARK: - Temp
struct Temp: Codable {
    var day, min, max, night: Double?
    var eve, morn: Double?
}

// MARK: - Weather
struct Weather: Codable {
    var id: Int?
    var main, weatherDescription, icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

