//
//  Service.swift
//  WeatherForecast
//
//  Created by Palash Roy on 3/15/20.
//  Copyright © 2020 Palash Roy. All rights reserved.
//

import UIKit

class Service {
    let apiId = "ed60fcfbd110ee65c7150605ea8aceea"
    
    func getCurrentWeather(city: String, unit: String, completion: @escaping(CurrentWeatherResponse?)->()) {
        var urlString: String = "https://api.openweathermap.org/data/2.5/weather?q=<city>&appid=<api>&units=<unit>"
        
        urlString = urlString.replacingOccurrences(of: "<city>", with: city)
        urlString = urlString.replacingOccurrences(of: "<api>", with: apiId)
        urlString = urlString.replacingOccurrences(of: "<unit>", with: unit)
        guard let url = URL(string: urlString)  else { completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
              completion(nil)
                return
            }
            
            let currentResponse = try?
                JSONDecoder().decode(CurrentWeatherResponse.self, from: data)
//            print("\(String(describing: currentResponse))")
            if let currentResponse = currentResponse {
                completion(currentResponse)
            } else {
                completion(nil)
                return
            }
        }.resume()
        
    }
    
    func getForecast(city: String, unit: String,completion: @escaping (ForecastWeatherResponse?)->()) {
        var urlString: String = "https://api.openweathermap.org/data/2.5/forecast/daily/?q=<city>&appid=<api>&units=<unit>"
        urlString = urlString.replacingOccurrences(of: "<city>", with: city)
        urlString = urlString.replacingOccurrences(of: "<api>", with: apiId)
        urlString = urlString.replacingOccurrences(of: "<unit>", with: unit)
        guard let url = URL(string: urlString)  else { completion(nil)
        return
        }
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            guard let data = data, error == nil else {
              completion(nil)
                return
            }
             let forecastWeaterResponse = try? JSONDecoder().decode(ForecastWeatherResponse.self, from: data)
//            print("Response : \(forecastWeaterResponse!)")
            if let forecastWeaterResponse = forecastWeaterResponse {
                completion(forecastWeaterResponse)
            } else {
                completion(nil)
                return
            }
        }
    task.resume()
    }
}
