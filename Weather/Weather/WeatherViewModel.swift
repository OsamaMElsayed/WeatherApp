//
//  File.swift
//  Weather
//
//  Created by osama on 11/18/18.
//  Copyright © 2018 osama. All rights reserved.
//

import Foundation
import CoreLocation

class WeatherViewModel{
    var webService:WebService
    
    init(){
       webService = WebService()
    }
    
    func getWeather(place: String, completion: @escaping (Double) -> Void){
        getCoordinateFrom(address: place) { coordinate, error in
            guard let coordinate = coordinate, error == nil else { return }
            
           let lat = coordinate.latitude as? Double
            let long = coordinate.longitude as?Double
            let apiCall =
            "https://api.darksky.net/forecast/dd492cec44f6dfea8728145ed3debbc2/\(lat!),\(long!)"
             self.webService.getWeather(urlStr: apiCall){ temp in
                let celsius = ceil( (temp - 32) * 5.0/9.0)
                completion(celsius)
        }
        }}
    
    
    func getCoordinateFrom(address: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> () ) {
        CLGeocoder().geocodeAddressString(address) { placemarks, error in
            completion(placemarks?.first?.location?.coordinate, error)
        }
    }
}
