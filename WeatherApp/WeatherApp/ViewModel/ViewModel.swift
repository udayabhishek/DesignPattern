//
//  ViewModel.swift
//  WeatherApp
//
//  Created by Uday Abhishek on 26/05/25.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    @Published var weather: WeatherResponse?
    @Published var errorMessage: String?

    private let weatherService: WeatherServiceProtocol

    init(weatherService: WeatherServiceProtocol = WeatherService()) {
        self.weatherService = weatherService
    }

    func fetchWeather(forLatitude lat: Double, longitude lon: Double) {
        weatherService.fetchWeather(forLatitude: lat, longitude: lon) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let weatherResponse):
                    self?.weather = weatherResponse
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
