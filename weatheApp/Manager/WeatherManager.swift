//
//  WeatherManager.swift
//  weatheApp
//
//  Created by Ahmed Mac on 20/11/2025.
//

import CoreLocation
import Foundation

class WeatherManager {
    func getCurrentWeather(latitude: CLLocationDegrees, langitute: CLLocationDegrees) async throws -> ResponseBody{
        var apiKey = "d184a01cfc89cdaf81e8b1bc8633926b"
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(langitute)&appid=\(apiKey)")
        else {
            fatalError("Missing URL")
        }
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode  == 200 else {
            fatalError("error fetching data weather")
        }
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        print(decodedData)
        return decodedData
    }
}

// Model of the response body we get from calling the OpenWeather API
struct ResponseBody: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse

    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }

    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }

    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}

extension ResponseBody.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}
