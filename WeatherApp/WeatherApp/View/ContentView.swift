//
//  ContentView.swift
//  WeatherApp
//
//  Created by Uday Abhishek on 22/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    @StateObject private var viewModel = WeatherViewModel()

    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)

            VStack {
                if let weather = viewModel.weather {
                    CityTextView(cityName: isNight ? weather.name : "Bulandshahr")
                    let temp =
                    CurrentWeatherView(imageName: isNight ? "smoke.fill" : "cloud.sun.rain.fill",
                                       temperature: isNight ? temp : 33)
                    
                    
                    
                    
                    Text("Temperature: \(weather.main.temp, specifier: "%.1f")°C")
                        .font(.headline)
                    Text("Weather: \(weather.weather.first?.description ?? "N/A")")
                        .font(.subheadline)
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                } else {
                    Text("Loading...")
                }
                
                
                
                Spacer()
                
                HStack(spacing: 30) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.rain.fill",
                                   temperature: 50)
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 30)
                    
                    WeatherDayView(dayOfWeek: "THS",
                                   imageName: "cloud.snow.fill",
                                   temperature: 60)
                    
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "tornado",
                                   temperature: 60)
                    
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "wind",
                                   temperature: 50)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                    
                   
                } label: {
                    WeatherButton(title: "Change day time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                Spacer()
            }
        }
        .onAppear {
            viewModel.fetchWeather(forLatitude: 12.9716, longitude: 77.5946)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 25, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(colors: [isNight ? .blue : .black, isNight ? .gray : Color("lightBlue1")],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct CurrentWeatherView: View {
    var imageName: String
    var temperature: Double
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 60, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}
