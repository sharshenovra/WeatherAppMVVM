//
//  SearchViewModel.swift
//  MVVMTest
//
//  Created by Ruslan Sharshenov on 21.02.2022.
//

import Foundation

protocol SearchDelegate: AnyObject{
    func showCities(model: [SearchModel]?)
}

class SearchViewModel{
    
    private weak var delegate: SearchDelegate? = nil
    private var repository: CityApiRepository
    
    init(delegate: SearchDelegate, repository: CityApiRepository = ApiClient.shared) {
        self.delegate = delegate
        self.repository = repository
    }
    
    func getCities(){
        ApiClient.shared.searchCity { model in
            self.delegate?.showCities(model: model)
        }
    }
}
