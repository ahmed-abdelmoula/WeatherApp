//
//  WelcomeVIew.swift
//  weatheApp
//
//  Created by Ahmed Mac on 18/11/2025.
//

import SwiftUI
import CoreLocationUI

struct WelcomeVIew: View {
    @EnvironmentObject var locationManager : LocationManager
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Welcome to Weather App").bold().font(.title)
                
                Text("Please share your current Location to get the weather in your area").padding()
                
            }.multilineTextAlignment(.center).padding()
        
        LocationButton(.shareCurrentLocation) {
            locationManager.makeRequest()
        }.cornerRadius(20)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }.frame(maxWidth: .infinity , maxHeight: .infinity)
    }
}

#Preview {
    WelcomeVIew()
}
