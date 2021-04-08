//
//  Helper.swift
//  WeatherForecast
//
//  Created by Palash Roy on 3/16/20.
//  Copyright © 2020 Palash Roy. All rights reserved.
//

import Foundation

struct Helper {
    static func timeConverter(time: String) -> String {
        let inFormatter = DateFormatter()
        inFormatter.locale = Locale(identifier: "en_US_POSIX")
        inFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let outFormatter = DateFormatter()
        outFormatter.locale = Locale(identifier: "en_US_POSIX")
        outFormatter.dateFormat = "EEEE, MMM dd, yyyy"

//        let inStr = "16:50"
        guard let date: Date = inFormatter.date(from: time) else {
            return ""
        }
        let outStr = outFormatter.string(from: date)
        return outStr // -> outputs 04:50
    }
    
    func timeConverter2(timeStamp: Int, isDay: Bool) -> String {
        
        let unixTimestamp = timeStamp // so we can get milliseconds!
        
        let date = Date(timeIntervalSince1970: TimeInterval(unixTimestamp))
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = isDay ? "EEEE" : "EEEE, MMM dd, yyyy"
        
        return dateFormatter.string(from: date)
        
    }
    
    static func showWeatherIcon(item: Weather) -> String {
                
                let main = item.main
                
                switch main {
                case "Ash":
                    return "cloud.hail"
                case "Clear":
                    return "sun.max"
                case "Clouds":
                    return "cloud.sun.fill"
                case "Drizzle":
                    return "cloud.drizzle.fill"
                case "Dust":
                    return "sun.dust.fill"
                case "Fog":
                    return "cloud.fog.fill"
                case "Haze":
                    return "sun.haze.fill"
                case "Mist":
                    return "cloud.drizzle"
                case "Rain":
                    return "cloud.rain.fill"
                case "Sand":
                    return "cloud.hail"
                case "Snow":
                    return "cloud.snow.fill"
                case "Squall":
                    return "cloud.hail"
                case "Thunderstorm":
                    return "cloud.bolt.fill"
                default:
                    return "clear"
                }
                
            }
    
    func getUnitType(unit: String, type: String) -> String {
        switch unit {
        case "metric":
            switch type {
            case "temp":
                return"C"
            case "speed":
                return "m/s"
            default:
                return ""
            }
        case "imperial":
        switch type {
        case "temp":
            return"F"
        case "speed":
            return "mi/h"
        default:
            return ""
        }
        default:
            switch type {
            case "temp":
                return"C"
            case "distance":
                return "m/s"
            default:
                return ""
            }
        }
    }
    
    /*func showWeatherIcon(item: TopLevel) -> String {
            
        let main = (item.list.first?.weather.first?.main)!
            
            switch main {
            case "Ash":
                return "cloud.hail"
            case "Clear":
                return "sun.max"
            case "Clouds":
                return "cloud.sun.fill"
            case "Drizzle":
                return "cloud.drizzle.fill"
            case "Dust":
                return "sun.dust.fill"
            case "Fog":
                return "cloud.fog.fill"
            case "Haze":
                return "sun.haze.fill"
            case "Mist":
                return "cloud.drizzle"
            case "Rain":
                return "cloud.rain.fill"
            case "Sand":
                return "cloud.hail"
            case "Snow":
                return "cloud.snow.fill"
            case "Squall":
                return "cloud.hail"
            case "Thunderstorm":
                return "cloud.bol.fill"
                
            default:
                return "clear"
            }
            
        }*/

}
