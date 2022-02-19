import Foundation
import SnapKit
import Kingfisher

class ForecastCell: UITableViewCell {
    
    var dayTitle = CustomUILabel(title: "", fontSize: 20)
    var forecastMinTempTitle = CustomUILabel(title: "", fontSize: 40)
    var forecastMaxTempTitle = CustomUILabel(title: "", fontSize: 40)
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
            make.centerX.equalToSuperview().offset(-30)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().dividedBy(1.5)
            make.width.equalTo(frame.height)
        }
        
        addSubview(forecastMinTempTitle)
        forecastMinTempTitle.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(forecastImage.snp.right).offset(8)
        }
        
        addSubview(forecastMaxTempTitle)
        forecastMaxTempTitle.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(forecastMinTempTitle.snp.right).offset(16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fill(model: Day) {
        forecastMaxTempTitle.text = "\(model.maxtempC!)°"
        forecastMinTempTitle.text = "\(model.mintempC!)°"
        
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


