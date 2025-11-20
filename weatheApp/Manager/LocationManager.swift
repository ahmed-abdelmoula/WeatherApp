//
//  LocationManager.swift
//  weatheApp
//
//  Created by Ahmed Mac on 18/11/2025.
//

import Foundation
import CoreLocation

public class LocationManager : NSObject, ObservableObject , CLLocationManagerDelegate {
    let manager = CLLocationManager()
    @Published var location :CLLocationCoordinate2D?
    @Published var isLoading : Bool
    
     override init() {
         isLoading = false
         super.init()
         manager.delegate = self
    }
    
    func makeRequest() {
         isLoading = true
        manager.requestLocation()
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.location = locations.first?.coordinate
        isLoading = false
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("eerror getting location ", error)
        isLoading = false
    }
    
}
