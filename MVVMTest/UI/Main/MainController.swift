import UIKit
import SnapKit
import Kingfisher

class MainController: UIViewController {
    
    private lazy var locationLabel = CustomUILabel(title: "", fontSize: 30)
    private lazy var tempLabel = CustomUILabel(title: "" , fontSize: 70)
    private lazy var feelImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        return view
    }()
    private lazy var forecastTableView = ForecastTableView()
    private lazy var changeCityButton = CustomButton(title: "Edit")
    
    private lazy var viewModel: MainViewModel = {
        return MainViewModel(delegate: self)
    }()
    
    private var models: WeatherModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        viewModel.getWeather()
    }
    
    func setupViews(model: WeatherModel?){
        view.backgroundColor = .black
        locationLabel.text = UserDefaults.standard.string(forKey: "CityName")
        tempLabel.text = "\(Int(model?.dailyForecasts?[0].temperature?.maximum?.value ?? 0.0))°"
        
        let icon = model?.dailyForecasts![0].day?.icon
        
        if (icon ?? 0) > 9 {
            feelImage.kf.setImage(with: URL(string: "https://developer.accuweather.com/sites/default/files/\((icon ?? 0))-s.png")!)
        } else {
            feelImage.kf.setImage(with: URL(string: "https://developer.accuweather.com/sites/default/files/0\((icon ?? 0))-s.png")!)
        }
        changeCityButton.setOnClickListener { view in
            self.navigationController?.pushViewController(SearchController(), animated: true)
        }
    }
    
    func setupConstraints(){
        view.addSubview(changeCityButton)
        changeCityButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeArea.top)
            make.right.equalToSuperview().offset(-8)
        }
        
        view.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeArea.top)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(tempLabel)
        tempLabel.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(feelImage)
        feelImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(view.frame.width / 3)
            make.centerY.equalToSuperview().dividedBy(1.5)
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
    func showHourly(model: [HourlyModelElement]?) {
        DispatchQueue.main.async {
            self.forecastTableView.fillfull(model: model)
        }
    }
    
    func showWeather(model: WeatherModel?) {
        DispatchQueue.main.async {
            self.models = model
            self.setupViews(model: model)
            self.forecastTableView.fill(models: model)
        }
    }
}
