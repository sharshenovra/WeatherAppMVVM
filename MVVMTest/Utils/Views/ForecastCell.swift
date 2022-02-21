import UIKit
import SnapKit
import Kingfisher

class ForecastCell: UITableViewCell {
    
    private lazy var dayTempLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        view.text = "15° day"
        return view
    }()
    
    private lazy var nightTempLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        view.text = "night -1°"
        return view
    }()
    
    private lazy var weatherIcon: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    override func layoutSubviews() {
        addSubview(dayTempLabel)
        dayTempLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        addSubview(nightTempLabel)
        nightTempLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
        
        addSubview(weatherIcon)
        weatherIcon.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(40)
        }
    }
    func fill(dayOne: DailyForecast?) {
            dayTempLabel.text = "\(Int(dayOne?.temperature?.maximum?.value ?? 0)) °C"
            
            nightTempLabel.text = "\(Int(dayOne?.temperature?.minimum?.value ?? 0)) °C"
            
            let icon = dayOne?.night?.icon
            
            if (icon ?? 0) > 9 {
                weatherIcon.kf.setImage(with: URL(string: "https://developer.accuweather.com/sites/default/files/\((icon ?? 0))-s.png")!)
            } else {
                weatherIcon.kf.setImage(with: URL(string: "https://developer.accuweather.com/sites/default/files/0\((icon ?? 0))-s.png")!)
            }
        }
}
