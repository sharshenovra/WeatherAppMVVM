import Foundation
import SnapKit

class ForecastTableView: UIView{
    
    private lazy var forecastTableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .systemBlue
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
        return (models?.count ?? 0) + 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = forecastTableView.dequeueReusableCell(withIdentifier: "CustomDailyCell") as! CustomDailyCell
            if (models?[indexPath.row + 1]) != nil {
                cell.fill(models: modelsToCellection)
            }
            return cell
        }else if indexPath.row == 1{
            let cell = UITableViewCell()
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.accessoryType = cell.isSelected ? .checkmark : .none
            cell.selectionStyle = .none
            cell.backgroundColor = .systemBlue
            return cell
        }else if indexPath.row >= 2 && indexPath.row <= 4{
            let cell = forecastTableView.dequeueReusableCell(withIdentifier: "ForecastCell") as! ForecastCell
            
            let index = indexPath.row
            
            if index == 2{
                cell.dayTitle.text = "Сегодня"
            }else if index == 3{
                cell.dayTitle.text = "Завтра"
            }else{
                cell.dayTitle.text = "Послезавтра"
            }
            
            if let model = models?[indexPath.row - 2].day {
                cell.fill(model: model)
            }
            
            return cell
        }else{
            let cell = forecastTableView.dequeueReusableCell(withIdentifier: "DetailDailyCell") as! DetailDailyCell
            if let model = modelsToCellection?.current {
                cell.fillCell(model: model)
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 100
        }else if indexPath.row >= 1 && indexPath.row <= 4 {
            return 50
        }else{
            return 150
        }
    }
}
