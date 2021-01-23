//
//  GetProduct.swift
//  Shop
//
//  Created by Максим Вечирко on 23.01.2021.
//  Copyright © 2021 Максим Вечирко. All rights reserved.
//

import Alamofire


class GetProduct: AbstractRequestFactory {
    var errorParser: AbstractErrorParser
    
    var sessionManager: Session
    
    var queue: DispatchQueue
    
    var baseUrl = URL(string: APIUrls.baseUrl)!
    
    init(errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
    
}

extension GetProduct: GetProductRequestFactory {
    
    func getProduct(complate: @escaping (AFDataResponse<[Product]>) -> ()) {
        let requestModel = GetProductModel(baseUrl: baseUrl)
        self.request(request: requestModel, completionHandler: complate)
    }
    
    
}

extension GetProduct {
    struct GetProductModel: RequestRouter {
        var baseUrl: URL
        
        var method: HTTPMethod = .get
        
        var path: String = APIPaths.products
        
        var parameters: Parameters?
    }
}
