//
//  WeatherManager.swift
//  WeatherKitTutorial
//
//  Created by Nathanael Juan Gauthama on 23/07/24.
//

import Foundation
import WeatherKit

// MainActor is used so it can run in the background
@MainActor
class WeatherManager: ObservableObject {
    
    @Published var weather: Weather?
    
    //getWeather is used to fetch the weather instance for the specific latitude and longitude
    func getWeather(latitude: Double, longitude: Double) {
        Task.init {
            do {
                weather = try await Task.detached(priority: .userInitiated) {
                    return try await WeatherService.shared.weather(for: .init(latitude: latitude, longitude: longitude))
                }.value
            }catch{
                fatalError("\(error)")
            }
        }
    }
    
    //currentWeather is a computed property to get location's current weather
    var currentWeather: CurrentWeather? {
        let currentWeather = weather?.currentWeather
        
        return currentWeather
    }
}
