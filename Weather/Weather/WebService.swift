//
//  WebService.swift
//  Weather
//
//  Created by osama on 11/18/18.
//  Copyright © 2018 osama. All rights reserved.
//

import Foundation

class WebService{
    
    func getWeather(urlStr:String, completion: @escaping (Double) -> Void ){
    
        let url = URL(string: urlStr)!
        URLSession.shared.dataTask(with: url){
            data, _, _ in
            if let data = data{
            if let json = try! JSONSerialization.jsonObject(with: data) as? [String:Any]{
                
                    if let currently = json["currently"] as? [String:Any]{
                    if let temp = currently["temperature"] as? Double{
                        
                    completion(temp)
                        }
                        }
                    }
                }
            
    }.resume()
}
}
