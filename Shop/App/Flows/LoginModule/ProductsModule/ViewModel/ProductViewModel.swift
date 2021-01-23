//
//  ProductViewModel.swift
//  Shop
//
//  Created by Максим Вечирко on 23.01.2021.
//  Copyright © 2021 Максим Вечирко. All rights reserved.
//

import Foundation

protocol ProductResultProtocol: class {
    func refresh()
}

class ProductViewModel {
    var model: [Product] = [] {
        willSet {
           productResultProtocol?.refresh()
        }
    }
    weak var productResultProtocol: ProductResultProtocol?
    var requestFactory: RequestFactory!
    
    init(requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
    }
    
    func fetchProduct() {
        let request = requestFactory.getProducts()
        request.getProduct { (result) in
            switch result.result {
            case .success(let product):
                self.model = product
            case .failure(let error):
                print(error.errorDescription as Any)
            }
        }
    }
    
}
