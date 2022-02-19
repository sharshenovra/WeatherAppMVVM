//
//  ApiClient.swift
//  MVVMTest
//
//  Created by Ruslan Sharshenov on 18.02.2022.
//

import Foundation

protocol ApiRepository{
    func getWeather(callback: @escaping (WeatherModel?) -> Void)
}

class ApiClient: ApiRepository{
    static var shared = ApiClient()
    
    func getWeather(callback: @escaping (WeatherModel?) -> Void){
        URLSession.shared.dataTask(with: URL(string: "https://api.weatherapi.com/v1/forecast.json?key=a96b56ffcbd54ed788324438221902&q=Bishkek&days=3&aqi=no&alerts=no")!) { data, response, error in
            do{
                if let data = data{
                    callback(try JSONDecoder().decode(WeatherModel.self, from: data))
                    
                }else{
                    callback(nil)
                    print("JSON not to view")
                }
            }catch{
                callback(nil)
                print("JSON Error")
            }
        }.resume()
    }
}
