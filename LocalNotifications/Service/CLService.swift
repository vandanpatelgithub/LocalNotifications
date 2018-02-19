//
//  CLService.swift
//  LocalNotifications
//
//  Created by Patel, Vandan (ETW - FLEX) on 2/18/18.
//

import Foundation
import CoreLocation

class CLService: NSObject {
    private override init() {}
    static let shared = CLService()
    
    let locManager = CLLocationManager()
    var shouldSetRegion = true
    
    func authorize() {
        locManager.requestAlwaysAuthorization()
        locManager.desiredAccuracy = kCLLocationAccuracyBest
        locManager.delegate = self
    }
    
    func updateLocation() {
        shouldSetRegion = true
        locManager.startUpdatingLocation()
    }
}

extension CLService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.first, shouldSetRegion else { return }
        shouldSetRegion = false
        let region = CLCircularRegion(center: currentLocation.coordinate, radius: 20, identifier: "startPosition")
        manager.startMonitoring(for: region)
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        NotificationCenter.default.post(name: NSNotification.Name("internalNotification.enteredRegion"), object: nil)
    }
}
