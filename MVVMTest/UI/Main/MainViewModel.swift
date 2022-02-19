import Foundation

protocol MainDelegate: AnyObject{
    func showNews(model: WeatherModel?)
}

class MainViewModel{
    
    
    private weak var delegate: MainDelegate? = nil
    private var repository: ApiRepository
    
    init(delegate: MainDelegate, repository: ApiRepository = ApiClient.shared) {
        self.delegate = delegate
        self.repository = repository
    }
    
    func getNews(){
        ApiClient.shared.getNews { model in
            self.delegate?.showNews(model: model)
        }
    }
}
