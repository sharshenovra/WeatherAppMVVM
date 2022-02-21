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

protocol HourlyApiRepository{
    func getHourly(callback: @escaping ([HourlyModelElement]?) -> Void)
}

class ApiClient: ApiRepository, CityApiRepository, HourlyApiRepository{
    static var shared = ApiClient()
    
    func getWeather(callback: @escaping (WeatherModel?) -> Void){
        let cityKey = UserDefaults.standard.string(forKey: "City")!
        var url = URLComponents(string: "http://dataservice.accuweather.com/forecasts/v1/daily/5day/\(cityKey)")!
        url.queryItems = [
            URLQueryItem(name: "apikey", value: "D6hi8JoQ08oyKwdk8JSPUABSi9hb4L5d"),
            URLQueryItem(name: "language", value: "en"),
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
            URLQueryItem(name: "apikey", value: "D6hi8JoQ08oyKwdk8JSPUABSi9hb4L5d"),
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
    
    func getHourly(callback: @escaping ([HourlyModelElement]?) -> Void){
        let cityKey = UserDefaults.standard.string(forKey: "City")!
        var url = URLComponents(string: "http://dataservice.accuweather.com/forecasts/v1/hourly/12hour/\(cityKey)")!
        url.queryItems = [
            URLQueryItem(name: "apikey", value: "D6hi8JoQ08oyKwdk8JSPUABSi9hb4L5d"),
            URLQueryItem(name: "language", value: "en"),
            URLQueryItem(name: "details", value: "false"),
            URLQueryItem(name: "metric", value: "true")
        ]
        
        var request = URLRequest(url: url.url!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            do{
                if let data = data{
                    callback(try JSONDecoder().decode([HourlyModelElement].self, from: data))
                    
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
