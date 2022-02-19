import Foundation
import SnapKit
import Kingfisher

class ForecastCell: UITableViewCell {
    
    var dayTitle = CustomUILabel(title: "", fontSize: 30)
    var forecastMinTempTitle = CustomUILabel(title: "", fontSize: 30)
    var forecastMaxTempTitle = CustomUILabel(title: "", fontSize: 30)
    var forecastImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.systemBlue
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.blue.cgColor
        
        selectionStyle = UITableViewCell.SelectionStyle.none
        accessoryType = isSelected ? .checkmark : .none
        selectionStyle = .none
        
        addSubview(dayTitle)
        dayTitle.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(8)
        }
        
        addSubview(forecastImage)
        forecastImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
            make.width.equalTo(frame.height / 1.5)
        }
        
        addSubview(forecastMaxTempTitle)
        forecastMaxTempTitle.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-16)
        }
        
        addSubview(forecastMinTempTitle)
        forecastMinTempTitle.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(forecastMaxTempTitle.snp.left).offset(-40)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fill(model: Day) {
        forecastMaxTempTitle.text = "\(Int(model.maxtempC!))°"
        forecastMinTempTitle.text = "\(Int(model.mintempC!))°"
        
        var image = ""
        
        if model.condition?.text == "Sunny"{
            image = "sun.max.fill"
            forecastImage.tintColor = UIColor.yellow
        }else if model.condition?.text == "Clear"{
            image = "cloud.fill"
            forecastImage.tintColor = UIColor.white
        }else{
            image = "cloud.rain.fill"
        }
        forecastImage.image = UIImage(systemName: image)
    }
    
}


