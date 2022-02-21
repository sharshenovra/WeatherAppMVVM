//
//  SplashController.swift
//  MVVMTest
//
//  Created by Ruslan Sharshenov on 20.02.2022.
//

import Foundation
import UIKit

class SplashController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        if UserDefaults.standard.string(forKey: "City") != nil {
            navigationController?.pushViewController(MainController(), animated: true)
        } else {
            navigationController?.pushViewController(SearchController(), animated: true)
        }

    }


}

