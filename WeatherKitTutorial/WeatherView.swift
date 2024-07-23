//
//  WeatherView.swift
//  WeatherKitTutorial
//
//  Created by Nathanael Juan Gauthama on 23/07/24.
//

import SwiftUI

struct WeatherView: View {
    // Implement WeatherManager within WeatherView
    @StateObject var weatherManager: WeatherManager = WeatherManager()
    
    var body: some View {
        VStack(spacing: 16) {
            //Use several currentWeather's property and display it within the app
            
            Text(weatherManager.currentWeather?.condition.description ?? "Weather error")
            
            Image(systemName: weatherManager.currentWeather?.symbolName ?? "")
                .resizable()
                .aspectRatio(1.5, contentMode: .fit)
                .frame(width: 80, height: 80)
            
            Text(weatherManager.currentWeather?.date.formatted(date: .omitted, time: .shortened) ?? "Date Error")
        }
        .padding()
        .onAppear{
            Task {
                // getWeather is called whenever the page is appeared
                // PS. Jakarta's coordinate is used here as a placeholder
                weatherManager.getWeather(latitude: -6.200000, longitude: 106.816666)
            }
        }
    }
}

#Preview {
    WeatherView()
}
