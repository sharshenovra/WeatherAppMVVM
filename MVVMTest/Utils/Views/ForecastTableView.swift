import Foundation
import SnapKit
import CoreAudio

class ForecastTableView: UIView{
    
    private lazy var forecastTableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .black
        view.register(ForecastCell.self, forCellReuseIdentifier: "ForecastCell")
        view.register(CustomDailyCell.self, forCellReuseIdentifier: "CustomDailyCell")
        view.register(DetailDailyCell.self, forCellReuseIdentifier: "DetailDailyCell")
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    override func layoutSubviews() {
        layer.opacity = 0.8
        
        addSubview(forecastTableView)
        forecastTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    private var models: [DailyForecast]? = nil
    private var modelsToCellection: WeatherModel? = nil
    private var modelsHourly: [HourlyModelElement]? = nil
    
    func fill(models: WeatherModel?) {
        self.models = models?.dailyForecasts
        self.modelsToCellection = models
        forecastTableView.reloadData()
    }
    func fillfull(model: [HourlyModelElement]?){
        self.modelsHourly = model
        forecastTableView.reloadData()
    }
}

extension ForecastTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (models?.count ?? 0) + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row >= 0 && indexPath.row < models?.count ?? 0{
            let cell = forecastTableView.dequeueReusableCell(withIdentifier: "ForecastCell") as! ForecastCell
            
            let index = indexPath.row
            
            if let model = models?[index] {
                cell.fill(dayOne: model)
            }
            
            return cell
        }else if indexPath.row == models?.count{
            let cell = forecastTableView.dequeueReusableCell(withIdentifier: "CustomDailyCell") as! CustomDailyCell
            cell.fill(models: modelsHourly)
            return cell
        }else{
            let cell = forecastTableView.dequeueReusableCell(withIdentifier: "DetailDailyCell") as! DetailDailyCell
            if let model = modelsToCellection?.dailyForecasts?[0].day {
                cell.fillCell(model: model)
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row >= 0 && indexPath.row <= models?.count ?? 0{
            return 100
        }
        return 150
    }
}
