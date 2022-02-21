import Foundation
import UIKit
import SnapKit

class DetailDailyCell: UITableViewCell{
    
    private lazy var windImage = UIImageView()
    private lazy var windLabel = CustomUILabel(title: "", fontSize: 25)
    private lazy var windDirectionImage = UIImageView()
    private lazy var windDirectionLabel = CustomUILabel(title: "", fontSize: 25)
    private lazy var solarIrradianceImage = UIImageView()
    private lazy var solarIrradianceLabel = CustomUILabel(title: "", fontSize: 25)
    private lazy var rainChanceImage = UIImageView()
    private lazy var rainChanceLabel = CustomUILabel(title: "", fontSize: 25)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        
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
        
        addSubview(windDirectionImage)
        windDirectionImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.centerX.equalToSuperview().offset(100)
            make.width.height.equalTo(25)
        }
        
        addSubview(windDirectionLabel)
        windDirectionLabel.snp.makeConstraints { make in
            make.top.equalTo(windDirectionImage.snp.bottom).offset(8)
            make.centerX.equalToSuperview().offset(100)
        }
        //
        addSubview(solarIrradianceImage)
        solarIrradianceImage.snp.makeConstraints { make in
            make.top.equalTo(windLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview().offset(-100)
            make.width.height.equalTo(25)
        }
        
        addSubview(solarIrradianceLabel)
        solarIrradianceLabel.snp.makeConstraints { make in
            make.top.equalTo(solarIrradianceImage.snp.bottom).offset(8)
            make.centerX.equalToSuperview().offset(-100)
        }
        
        addSubview(rainChanceImage)
        rainChanceImage.snp.makeConstraints { make in
            make.top.equalTo(windDirectionLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview().offset(100)
            make.width.height.equalTo(25)
        }
        
        addSubview(rainChanceLabel)
        rainChanceLabel.snp.makeConstraints { make in
            make.top.equalTo(rainChanceImage.snp.bottom).offset(8)
            make.centerX.equalToSuperview().offset(100)
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupSubViews(){
        windImage.image = UIImage(systemName: "wind")
        windDirectionImage.image = UIImage(systemName: "dial.min")
        solarIrradianceImage.image = UIImage(systemName: "humidity")
        rainChanceImage.image = UIImage(systemName: "eye")
        
        windImage.tintColor = .white
        windDirectionImage.tintColor = .white
        solarIrradianceImage.tintColor = .white
        rainChanceImage.tintColor = .white
    }
    
    func fillCell(model: Day) {
        windLabel.text = "\(model.wind?.speed?.value ?? 0.0) км/ч"
        windDirectionLabel.text = "\(model.wind?.direction?.degrees ?? 0) \(model.wind?.direction?.english ?? "")"
        solarIrradianceLabel.text = "\(model.solarIrradiance?.value ?? 0) W/m²"
        rainChanceLabel.text = "\(model.rainProbability ?? 0) %"
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
