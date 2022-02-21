//
//  SearchCityCell.swift
//  MVVMTest
//
//  Created by Ruslan Sharshenov on 20.02.2022.
//

import Foundation
import UIKit
import SnapKit

class SearchCityCell: UITableViewCell {
    
    private lazy var cityName: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        view.text = "Bishkek"
        return view
    }()
    
    private lazy var cityType: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.text = "City"
        return view
    }()
    
    private lazy var cityCountry: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.text = "Kyrgyzstan"
        return view
    }()
    
    private lazy var contanerView = UIView()
    
    override func layoutSubviews() {
        contanerView.layer.cornerRadius = 8
        contanerView.backgroundColor = .lightGray
        
        addSubview(contanerView)
        contanerView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10)
        }
        
        contanerView.addSubview(cityName)
        cityName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(8)
        }
        
        contanerView.addSubview(cityType)
        cityType.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-8)
            make.left.equalToSuperview().offset(8)
        }
        
        contanerView.addSubview(cityCountry)
        cityCountry.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-8)
            make.right.equalToSuperview().offset(-8)
        }
    }
    
    func fill(model: SearchModel?) {
        cityName.text = model?.localizedName
        cityType.text = model?.type
        
        cityCountry.text = model?.country?.localizedName
    }
}
