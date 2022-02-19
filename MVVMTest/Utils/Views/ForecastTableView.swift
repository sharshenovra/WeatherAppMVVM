import Foundation
import SnapKit

class ForecastTableView: UIView{

    private lazy var forecastTableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .darkGray
        view.register(ForecastCell.self, forCellReuseIdentifier: "ForecastCell")
        view.register(CustomDailyCell.self, forCellReuseIdentifier: "CustomDailyCell")
        return view
    }()
    
    override func layoutSubviews() {
        layer.opacity = 0.7
        
        addSubview(forecastTableView)
        forecastTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    private var models: [Forecastday]? = nil
    private var modelsToCellection: WeatherModel? = nil
    
    func fill(models: WeatherModel?) {
        self.models = models?.forecast?.forecastday
        self.modelsToCellection = models
        forecastTableView.reloadData()
    }
}

extension ForecastTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return models?.count + 1
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = forecastTableView.dequeueReusableCell(withIdentifier: "CustomDailyCell") as! CustomDailyCell
            if let model = models?[indexPath.row + 1] {
                cell.fill(models: modelsToCellection)
            }
            return cell
        }else{
            let cell = forecastTableView.dequeueReusableCell(withIdentifier: "ForecastCell") as! ForecastCell

            let index = indexPath.row
            
            if index == 1{
                cell.dayTitle.text = "Сегодня"
            }else if index == 2{
                cell.dayTitle.text = "Завтра"
            }else{
                cell.dayTitle.text = "Послезавтра"
            }
            
            if let model = models?[indexPath.row - 1].day {
                cell.fill(model: model)
            }
        
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 100
        }else{
            return 50
        }
        }
    }
