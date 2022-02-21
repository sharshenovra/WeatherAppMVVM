//
//  SearchController.swift
//  WeatherApp
//
//  Created by Doolot on 20/2/22.
//

import Foundation
import UIKit
import SnapKit

class SearchController: UIViewController {
    private lazy var searchField: UITextField = {
        let view = UITextField()
        view.layer.cornerRadius = 8
        view.backgroundColor = .black
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 20)
        view.attributedPlaceholder =
        NSAttributedString(string: "City name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        view.leftViewMode = .always
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()
    
    private lazy var serachButton: UIButton = {
        let view = UIButton()
        view.layer.cornerRadius = 8
        view.backgroundColor = .black
        view.setTitle("Search", for: .normal)
        view.addTarget(self, action: #selector(clickSearch(view:)), for: .touchUpInside)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()
    
    private lazy var searchTableView = SearchTableView()
    
    private var models: [SearchModel]? = nil
    private lazy var viewModel: SearchViewModel = {
        return SearchViewModel(delegate: self)
    }()
    
    @objc func clickSearch(view: UIButton) {
        getSearchCity()
    }
    
    private func getSearchCity() {
        UserDefaults.standard.set(searchField.text ?? "",forKey: "CityName")
        viewModel.getCities()
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .black
        
        setupSubview()
    }
    
    func setupSubview(){
        searchTableView.delegate = self
        
        view.addSubview(searchField)
        searchField.snp.makeConstraints { make in
            make.top.equalTo(view.safeArea.top).offset(10)
            make.left.equalToSuperview().offset(16)
            make.height.equalTo(40)
            make.width.equalTo(200)
        }
        
        view.addSubview(serachButton)
        serachButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeArea.top).offset(10)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(40)
            make.left.equalTo(searchField.snp.right).offset(10)
        }
        
        view.addSubview(searchTableView)
        searchTableView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeArea.bottom)
            make.left.right.equalToSuperview()
            make.top.equalTo(searchField.snp.bottom).offset(16)
        }
    }
}

extension SearchController: SearchDelegate{
    func showCities(model: [SearchModel]?) {
        DispatchQueue.main.async {
            self.models = model
            self.searchTableView.fill(models: model)
        }
    }
}

extension SearchController: SearchCityDelegate{
    func pushVC() {
        navigationController?.pushViewController(MainController(), animated: true)
    }
    
    
}

