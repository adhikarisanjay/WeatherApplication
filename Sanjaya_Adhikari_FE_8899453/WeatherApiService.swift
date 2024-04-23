//
//  WeatherService.swift
//  Sanjaya_Adhikari_8899453_Lab8
//
//  Created by Sanjay adhikari on 26/07/2023.
//

import Foundation

class WeatherService {
    private let baseUrl = "https://api.openweathermap.org/data/2.5/weather"
    private let apiKey = "d501b5f7a047044bd2c520db60d012c2"

    func fetchWeatherData(lat:Double,lng:Double, completion: @escaping (Weather?) -> Void) {
        let urlString = "\(baseUrl)?lat=\(lat)&lon=\(lng)&APPID=\(apiKey)&units=metric"

        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            do {
                let Weather = try JSONDecoder().decode(Weather.self, from: data)
                completion(Weather)
            } catch {
                completion(nil)
            }
        }.resume()
    }
}
