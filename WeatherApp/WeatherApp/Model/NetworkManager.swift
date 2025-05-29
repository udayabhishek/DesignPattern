//
//  Repository.swift
//  WeatherApp
//
//  Created by Uday Abhishek on 26/05/25.
//

import Foundation

protocol WeatherServiceProtocol {
    func fetchWeather(forLatitude lat: Double, longitude lon: Double, completion: @escaping (Result<WeatherResponse, Error>) -> Void)
}

class WeatherService: WeatherServiceProtocol {
    private let apiKey = "bc538eab4b16f9ba8a5cc1d4bd30786f" // Replace with your actual API key

    func fetchWeather(forLatitude lat: Double, longitude lon: Double, completion: @escaping (Result<WeatherResponse, Error>) -> Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=metric"

        guard let url = URL(string: urlString) else {
            completion(.failure(URLError(.badURL)))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }

            do {
                let decoder = JSONDecoder()
                let weatherResponse = try decoder.decode(WeatherResponse.self, from: data)
                completion(.success(weatherResponse))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
}
