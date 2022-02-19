import Foundation
import SnapKit

class ForecastTableView: UIView{

    private lazy var forecastTableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .darkGray
        view.register(ForecastCell.self, forCellReuseIdentifier: "ForecastCell")
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
    
    func fill(models: WeatherModel?) {
        self.models = models?.forecast?.forecastday
        forecastTableView.reloadData()
    }
}

extension ForecastTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = forecastTableView.dequeueReusableCell(withIdentifier: "ForecastCell") as! ForecastCell

        let index = indexPath.row
        
        if index == 0{
            cell.dayTitle.text = "Сегодня"
        }else if index == 1{
            cell.dayTitle.text = "Завтра"
        }else{
            cell.dayTitle.text = "Послезавтра"
        }
        
        if let model = models?[indexPath.row].day {
            cell.fill(model: model)
        }
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
