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

protocol CityApiRepository{
    func searchCity(callback: @escaping ([SearchModel]?) -> Void)
}

class ApiClient: ApiRepository, CityApiRepository{
    static var shared = ApiClient()
    
    let api = "roAr9G6A15bUdcXokKNtzSGwTgWngKhv"
    
    func getWeather(callback: @escaping (WeatherModel?) -> Void){
        let cityKey = UserDefaults.standard.string(forKey: "City")!
        var url = URLComponents(string: "http://dataservice.accuweather.com/forecasts/v1/daily/5day/\(cityKey)")!
        url.queryItems = [
            URLQueryItem(name: "apikey", value: "VO9jkGVnMXyFdJTNVvpRrZG1ZyjnGbsc"),
            URLQueryItem(name: "details", value: "true"),
            URLQueryItem(name: "metric", value: "true")
        ]
        
        
        var request = URLRequest(url: url.url!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
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
    
    func searchCity(callback: @escaping ([SearchModel]?) -> Void){
        var url = URLComponents(string: "http://dataservice.accuweather.com/locations/v1/cities/autocomplete")!
        let cityNameKey = UserDefaults.standard.string(forKey: "CityName")!
        url.queryItems = [
            URLQueryItem(name: "q", value: "\(cityNameKey)"),
            URLQueryItem(name: "apikey", value: "VO9jkGVnMXyFdJTNVvpRrZG1ZyjnGbsc"),
            URLQueryItem(name: "language", value: "en"),
        ]
        
        var request = URLRequest(url: url.url!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            do{
                if let data = data{
                    callback(try JSONDecoder().decode([SearchModel].self, from: data))
                    
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
