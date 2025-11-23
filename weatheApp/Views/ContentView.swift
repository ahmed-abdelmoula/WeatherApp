//
//  ContentView.swift
//  weatheApp
//
//  Created by Ahmed Mac on 18/11/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    var body: some View {
        WeatherVIew(weather: previewWeather)
//        VStack {
//            if let location = locationManager.location {
//                if let weather = weather {
//                    Text("data already fetched ")
//                    WeatherVIew(weather: previewWeather)
//                } else {
//                    LoadingView().task {
//                        do {
//                            try await weather = weatherManager.getCurrentWeather(latitude: location.latitude, langitute: location.longitude)
//                        } catch {
//                            
//                            print("error getting weather \(error)")
//                        }
//                    }
//                }
//
//            } else {
//                if locationManager.isLoading {
//                    LoadingView()
//                } else {
//                    WelcomeVIew().environmentObject(locationManager)
//                }
//            }
//        }
//        .background(Color(hue: 0.702, saturation: 0.981, brightness: 0.432)).preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
