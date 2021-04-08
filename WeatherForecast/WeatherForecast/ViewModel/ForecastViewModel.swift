//
//  ForecastViewModel.swift
//  WeatherForecast
//
//  Created by Palash Roy on 3/15/20.
//  Copyright © 2020 Palash Roy. All rights reserved.
//
import Combine
import SwiftUI

class ForecastViewModel: ObservableObject {
    var weatherService: Service = Service()
    var cityName: String = "London"
    var unit: String = "metric"
    
    @Published var weatherForecast = ForecastWeatherResponse()
    
    struct ForecastList: Identifiable {
        var id: Int
        var max: String
        var min: String
        var hum: String
        var wind: String
        var wimage: String
        var date: String
    }
    
    func forecastList() ->[ForecastList] {
        var x = [ForecastList]()
        if let lists = weatherForecast.list {
            var i = 0
            for mylist in lists {
                let max = String(format: "%.1f", mylist.temp?.max ?? 0) + "°" + Helper().getUnitType(unit: unit, type: "temp")
                let min = String(format: "%.1f", mylist.temp?.min ?? 0) + "°" + Helper().getUnitType(unit: unit, type: "temp")
                let hum = String(format: "%.1f", mylist.humidity ?? 0)
                let wind = String(format: "%.1f", mylist.speed ?? 0) + Helper().getUnitType(unit: unit, type: "speed")
                let date = Helper().timeConverter2(timeStamp: mylist.dt ?? 0, isDay: true)
                if let wImage =  mylist.weather?.first {
                    let img = Helper.showWeatherIcon(item: wImage)
                    x.append(ForecastList(id: i,max: max, min: min, hum: hum, wind: wind, wimage: img, date: date))
                    i += 1
                }
            }
        }
        return x
    }
    
    var city: String {
        if let city = weatherForecast.city?.name {
            return city
        } else {
            return ""
        }
    }
    
    var country: String {
        if let country = self.weatherForecast.city?.country {
            return country
        } else {
            return ""
        }
    }
    
    
    
    var lists: [List] {
        if let lists = self.weatherForecast.list {
            return lists
        } else {
            return [List]()
        }
    }
    
    
    
    func serachCity() {
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeatherForecast(city, unit)
        }
    }
    func fetchWeatherForecast(_ city: String, _ unit: String) {
        weatherService.getForecast(city: city, unit: unit) { forecast in
            if let forecast = forecast {
                DispatchQueue.main.async {
                    self.weatherForecast = forecast
                }
            }
        }
    }
}


