//
//  ContentView.swift
//  WeatherApp
//
//  Created by Uday Abhishek on 22/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = true
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("lightBlue1"))
            
            VStack {
                CityTextView(cityName: "Bulandshahr, UP")
                
                CurrentWeatherView(imageName: "cloud.sun.rain.fill", temperature: 33)
                Spacer()
                
                HStack {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.rain.fill", temperature: 50)
                    
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 30)
                    
                    WeatherDayView(dayOfWeek: "THS", imageName: "cloud.snow.fill", temperature: 60)
                    
                    WeatherDayView(dayOfWeek: "FRI", imageName: "tornado", temperature: 60)
                    
                    WeatherDayView(dayOfWeek: "SAT", imageName: "wind", temperature: 50)
                }
                Spacer()
                
                Button {
                    print("tapped")
                } label: {
                    Text("Change time")
                        .frame(width: 280, height: 50)
                        .background(.white)
                        .cornerRadius(5)
                        .font(.system(size: 20, weight: .bold, design: .default))
                }
                .font(.system(size: 32, weight: .medium, design: .default))
                
                Spacer()
            }
        }
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

struct CurrentWeatherView: View {
    var imageName: String
    var temperature: Int
    
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

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(colors: [topColor, bottomColor],
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
