import Foundation
import UIKit
import SnapKit

class DailyCell: UICollectionViewCell{
    
    private lazy var hourLabel = CustomUILabel(title: "", fontSize: 25)
    private lazy var feelImage = UIImageView()
    private lazy var tempLabel = CustomUILabel(title: "", fontSize: 20)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
        backgroundColor = .systemBlue
    }
    
    private func setupSubViews(){
        
        addSubview(hourLabel)
        hourLabel.snp.makeConstraints { make in
            make.top.centerX.equalToSuperview()
        }
        addSubview(tempLabel)
        tempLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        addSubview(feelImage)
        feelImage.snp.makeConstraints { make in
            make.top.equalTo(tempLabel.snp.bottom).offset(4)
            make.width.equalToSuperview().dividedBy(2)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    func fillCell(model: Hour, hour: String) {
        var image = ""
        
        if model.condition?.text == "Sunny"{
            image = "sun.max.fill"
            feelImage.tintColor = UIColor.yellow
        }else if model.condition?.text == "Clear"{
            image = "cloud.fill"
            feelImage.tintColor = UIColor.white
        }else{
            image = "cloud.rain.fill"
            feelImage.tintColor = UIColor.white
        }
        tempLabel.text = "\(Int(model.tempC ?? 0.0))"
        hourLabel.text = hour
        feelImage.image = UIImage(systemName: "\(image)")
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
