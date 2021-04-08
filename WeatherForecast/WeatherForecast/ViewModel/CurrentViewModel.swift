//
//  CurrentViewModel.swift
//  WeatherForecast
//
//  Created by Palash Roy on 3/18/20.
//  Copyright © 2020 Palash Roy. All rights reserved.
//

import Foundation

class CurrentViewModel: ObservableObject {
    var weatherService: Service = Service()
    var cityName = "London"
    var unit: String = "metric"
    
    @Published var currentWeather = CurrentWeatherResponse()
    @Published var weatherForecast = ForecastWeatherResponse()
    
    var currentDate: String {
        if let currentDate = self.currentWeather.dt {
            return Helper().timeConverter2(timeStamp: currentDate, isDay: false)
        } else {
            return ""
        }
    }
    
    
    var description: String {
        if let description = self.currentWeather.weather?.first?.weatherDescription {
            return description.localizedCapitalized
        } else {
            return ""
        }
    }
    
    var wind: String {
        if let wind = self.currentWeather.wind?.speed {
            return String(wind) + Helper().getUnitType(unit: unit, type: "speed")
        } else {
            return ""
        }
    }
    
    var humidity: String {
        if let humidity = self.currentWeather.main?.humidity {
            return String(humidity)
        } else {
            return ""
        }
    }
    
    var temparature: String {
        if let temp = self.currentWeather.main?.temp
        {
            return String(format: "%.1f", temp) + "°" + Helper().getUnitType(unit: unit, type: "temp")
        } else {
            return ""
        }
    }
    
    var maxTemp: String {
        if let maxTemp = self.currentWeather.main?.tempMax {
            return String(maxTemp) + "°" + Helper().getUnitType(unit: unit, type: "temp")
        } else {
            return ""
        }
    }
    
    var weather: Weather {
        if let weather = self.currentWeather.weather?.first {
            return weather
        } else {
            return Weather(id: 0, main: "", weatherDescription: "", icon: "")
        }
    }
    
    var city: String {
        if let city = currentWeather.name {
            return city
        } else {
            return ""
        }
    }
    
    var country: String {
        if let country = self.currentWeather.sys?.country {
            return country
        } else {
            return ""
        }
    }
    
    func serachCity() {
        if let city = cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchCurrentWeather(city, unit)
            
            //ForecastViewModel().serachCity()
        }
    }
    
    func fetchCurrentWeather(_ city: String, _ unit: String) {
        weatherService.getCurrentWeather(city: city, unit: unit) { (weather) in
            if let weather = weather {
                DispatchQueue.main.async {
                    self.currentWeather = weather
                }
                
            }
        }
    }
    
}
