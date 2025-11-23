//
//  WeatherVIew.swift
//  weatheApp
//
//  Created by Ahmed Mac on 21/11/2025.
//

import SwiftUI

struct WeatherVIew: View {
    var weather: ResponseBody
    var body: some View {
        ZStack {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)

                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }.frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal, 10)
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "cloud")
                                .font(.system(size: 40))
                            Text("\(weather.weather[0].main)")
                        }
                        Spacer()
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)

                    }.padding(.horizontal, 20)
                    Spacer().frame(height: 80)

                    CustomAsyncImage(url: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")
                        .frame(width: 350)
                    Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)

            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now").bold().padding(.bottom)
                    VStack {
                        HStack {
                            WeatherRow(logo: "thermometer", name: "Min temp", value: weather.main.tempMin.roundDouble() + "°")
                            Spacer()
                            WeatherRow(logo: "thermometer", name: "Max temp", value: weather.main.tempMax.roundDouble() + "°")
                        }

                        HStack {
                            WeatherRow(logo: "wind", name: "Wind speed", value: weather.wind.speed.roundDouble() + " m/s")
                            Spacer()
                            WeatherRow(logo: "humidity", name: "Humidity", value: "\(weather.main.humidity.roundDouble())%")
                        }
                    }.padding(.horizontal)
                } .padding()
                    .padding(.bottom, 20)
                    .background(.white)
                    .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                    .cornerRadius(20, corners: [.topLeft, .topRight])
            }

        }.edgesIgnoringSafeArea(.bottom)
            .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
            .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherVIew(weather: previewWeather)
}
