import Foundation
import SnapKit
import CoreAudio

protocol SearchCityDelegate: AnyObject {
    func pushVC()
}

class SearchTableView: UIView{
    
    private lazy var searchTableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = UIColor(red: 135 / 255, green: 206 / 255, blue: 250 / 255, alpha: 1)
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    override func layoutSubviews() {
        layer.opacity = 0.8
        
        addSubview(searchTableView)
        searchTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    private var models: [SearchModel]? = nil
    weak var delegate: SearchCityDelegate? = nil
    
    func fill(models: [SearchModel]?) {
        self.models = models
        searchTableView.reloadData()
    }
}

extension SearchTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = models?[indexPath.row]
        
        if let model = model {
            UserDefaults.standard.set(model.key ?? String(),forKey: "City")
            UserDefaults.standard.set(model.localizedName ?? String(),forKey: "CityName")
            delegate?.pushVC()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80 + 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models?[indexPath.row]
        let cell = SearchCityCell()
        
        cell.fill(model: model)
        
        return cell
    }
}
