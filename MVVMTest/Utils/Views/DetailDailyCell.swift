import Foundation
import UIKit
import SnapKit

class DetailDailyCell: UITableViewCell{
    
    private lazy var windImage = UIImageView()
    private lazy var windLabel = CustomUILabel(title: "", fontSize: 25)
    private lazy var pressureImage = UIImageView()
    private lazy var pressureLabel = CustomUILabel(title: "", fontSize: 25)
    private lazy var humidityImage = UIImageView()
    private lazy var humidityLabel = CustomUILabel(title: "", fontSize: 25)
    private lazy var visibilityImage = UIImageView()
    private lazy var visibilityLabel = CustomUILabel(title: "", fontSize: 25)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.systemBlue
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.blue.cgColor
        
        selectionStyle = UITableViewCell.SelectionStyle.none
        accessoryType = isSelected ? .checkmark : .none
        selectionStyle = .none
        
        setupSubViews()
        setupConstraints()
    }
    
    private func setupConstraints(){
        addSubview(windImage)
        windImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.centerX.equalToSuperview().offset(-100)
            make.width.height.equalTo(25)
        }
        
        addSubview(windLabel)
        windLabel.snp.makeConstraints { make in
            make.top.equalTo(windImage.snp.bottom).offset(8)
            make.centerX.equalToSuperview().offset(-100)
        }
        
        addSubview(pressureImage)
        pressureImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.centerX.equalToSuperview().offset(100)
            make.width.height.equalTo(25)
        }
        
        addSubview(pressureLabel)
        pressureLabel.snp.makeConstraints { make in
            make.top.equalTo(pressureImage.snp.bottom).offset(8)
            make.centerX.equalToSuperview().offset(100)
        }
        //
        addSubview(humidityImage)
        humidityImage.snp.makeConstraints { make in
            make.top.equalTo(windLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview().offset(-100)
            make.width.height.equalTo(25)
        }
        
        addSubview(humidityLabel)
        humidityLabel.snp.makeConstraints { make in
            make.top.equalTo(humidityImage.snp.bottom).offset(8)
            make.centerX.equalToSuperview().offset(-100)
        }
        
        addSubview(visibilityImage)
        visibilityImage.snp.makeConstraints { make in
            make.top.equalTo(pressureLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview().offset(100)
            make.width.height.equalTo(25)
        }
        
        addSubview(visibilityLabel)
        visibilityLabel.snp.makeConstraints { make in
            make.top.equalTo(visibilityImage.snp.bottom).offset(8)
            make.centerX.equalToSuperview().offset(100)
        }
    }
    
    private func setupSubViews(){
        windImage.image = UIImage(systemName: "wind")
        pressureImage.image = UIImage(systemName: "dial.min")
        humidityImage.image = UIImage(systemName: "humidity")
        visibilityImage.image = UIImage(systemName: "eye")
        
        windImage.tintColor = .white
        pressureImage.tintColor = .white
        humidityImage.tintColor = .white
        visibilityImage.tintColor = .white
    }
    
    func fillCell(model: Current) {
        windLabel.text = "\(model.windKph ?? 0.0) км/ч"
        pressureLabel.text = "\(model.pressureMB ?? 0) кПа"
        humidityLabel.text = "\(model.humidity ?? 0) %"
        visibilityLabel.text = "\(model.visKM ?? 0) км"
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
