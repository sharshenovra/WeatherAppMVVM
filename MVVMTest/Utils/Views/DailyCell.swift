import Foundation
import UIKit
import SnapKit
import Kingfisher

class DailyCell: UICollectionViewCell{
    
    private lazy var hourLabel = CustomUILabel(title: "", fontSize: 25)
    private lazy var feelImage = UIImageView()
    private lazy var tempLabel = CustomUILabel(title: "", fontSize: 20)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
        backgroundColor = .black
    }
    
    private func setupSubViews(){
        
        addSubview(hourLabel)
        hourLabel.snp.makeConstraints { make in
            make.top.centerX.equalToSuperview()
        }
        addSubview(tempLabel)
        tempLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-8)
        }
        
        addSubview(feelImage)
        feelImage.snp.makeConstraints { make in
            make.top.equalTo(tempLabel.snp.bottom)
            make.width.equalToSuperview().dividedBy(2)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    func fillCell(model: HourlyModelElement, hour: String) {
        tempLabel.text = "\(Int(model.temperature?.value ?? 0.0))"
        hourLabel.text = "\(hour)"
        
        let icon = model.weatherIcon
        
        if (icon ?? 0) > 9 {
            feelImage.kf.setImage(with: URL(string: "https://developer.accuweather.com/sites/default/files/\((icon ?? 0))-s.png")!)
        } else {
            feelImage.kf.setImage(with: URL(string: "https://developer.accuweather.com/sites/default/files/0\((icon ?? 0))-s.png")!)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
