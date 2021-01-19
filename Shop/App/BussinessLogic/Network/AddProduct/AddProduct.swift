//
//  AddProduct.swift
//  Shop
//
//  Created by Максим Вечирко on 19.01.2021.
//  Copyright © 2021 Максим Вечирко. All rights reserved.
//

import Alamofire

class AddProduct: AbstractRequestFactory {
    var errorParser: AbstractErrorParser
    
    var sessionManager: Session
    
    var queue: DispatchQueue
    
    let baseURL = URL(string: "http://127.0.0.1:8080/")!
    
    init(errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
    
}

extension AddProduct: AddProductRequestFactory {
    func addProduct(product: Product, completionHandler: @escaping (AFDataResponse<ProductResult>) -> ()) {
        let requestModel = AddProduct(baseUrl: baseURL, model: product)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension AddProduct {
    struct AddProduct: RequestRouter {
        var baseUrl: URL
        
        var method: HTTPMethod = .post
        
        var path: String = "add"
        
        var model: Product
        
        var parameters: Parameters? {
            return [
                "products": [
                    "product_name": model.product_name,
                    "amount": model.amount,
                    "quantity": model.quantity
                ]
                
            ]
        }
        
        
        
    }
}

