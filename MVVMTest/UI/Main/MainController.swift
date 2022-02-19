import UIKit
import SnapKit
import Kingfisher

class MainController: UIViewController {
    
    private lazy var locationLabel = CustomUILabel(title: "", fontSize: 30)
    private lazy var tempLabel = CustomUILabel(title: "" , fontSize: 70)
    private lazy var feelImage = UIImageView()
    private lazy var forecastTableView = ForecastTableView()
    
    
    private lazy var viewModel: MainViewModel = {
        return MainViewModel(delegate: self)
    }()
    
    private var models: WeatherModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getWeather()
        setupConstraints()
    }

    func setupViews(model: WeatherModel?){
        view.backgroundColor = .systemBlue
        locationLabel.text = "\(model?.location?.name ?? "") \(model?.location?.country ?? "")"
        tempLabel.text = "\(model?.current?.tempC ?? 0.0)°"
        
        var image = ""
        
        if model?.current?.condition?.text == "Sunny"{
            image = "sun.max.fill"
            feelImage.tintColor = UIColor.yellow
        }else if model?.current?.condition?.text == "Clear"{
            image = "cloud.fill"
            feelImage.tintColor = UIColor.white
        }else{
            image = "cloud.rain.fill"
        }
        feelImage.image = UIImage(systemName: image)
    }
    
    func setupConstraints(){
        view.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeArea.top)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(tempLabel)
        tempLabel.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(36)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(feelImage)
        feelImage.snp.makeConstraints { make in
            make.top.equalTo(tempLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.height.equalTo(view.frame.width / 3)
            make.width.equalToSuperview().dividedBy(3)
        }
        view.addSubview(forecastTableView)
        forecastTableView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.centerY)
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
}

extension MainController: MainDelegate{
    func showWeather(model: WeatherModel?) {
        DispatchQueue.main.async {
            self.models = model
            self.setupViews(model: model)
            self.forecastTableView.fill(models: model)
        }
    }
}
