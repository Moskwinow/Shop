//
//  Register.swift
//  Shop
//
//  Created by Максим Вечирко on 21.12.2020.
//  Copyright © 2020 Максим Вечирко. All rights reserved.
//

import Alamofire

class Register: AbstractRequestFactory {
    
    var errorParser: AbstractErrorParser
    
    var sessionManager: Session
    
    var queue: DispatchQueue
    
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
    
}

extension Register: RegisterRequestFactory {
    func register(completionHandler: @escaping (AFDataResponse<RegisterResult>) -> ()) {
        let requestModel = RegisterUser(baseUrl: baseUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Register {
    struct RegisterUser: RequestRouter {
        var baseUrl: URL
        
        var method: HTTPMethod = .get
        
        var path: String = "registerUser.json"
        
        var parameters: Parameters?
        
        
    }
}
