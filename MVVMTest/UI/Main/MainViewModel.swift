import Foundation

protocol MainDelegate: AnyObject{
    func showWeather(model: WeatherModel?)
    func showHourly(model: [HourlyModelElement]?)
}

class MainViewModel{
    
    
    private weak var delegate: MainDelegate? = nil
    private var repository: ApiRepository
    
    init(delegate: MainDelegate, repository: ApiRepository = ApiClient.shared) {
        self.delegate = delegate
        self.repository = repository
    }
    
    func getWeather(){
        ApiClient.shared.getWeather { model in
            self.delegate?.showWeather(model: model)
        }
        ApiClient.shared.getHourly { model in
            self.delegate?.showHourly(model: model)
        }
    }
}
