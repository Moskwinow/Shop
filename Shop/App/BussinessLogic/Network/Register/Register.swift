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
    
    let baseUrl = URL(string: "https://floating-refuge-56799.herokuapp.com/")!
    
    init(errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
    
}

extension Register: RegisterRequestFactory {
    func register(user: User, completionHandler: @escaping (AFDataResponse<RegisterResult>) -> ()) {
        let requestModel = RegisterUser(baseUrl: baseUrl, user: user)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func register(completionHandler: @escaping (AFDataResponse<RegisterResult>) -> ()) {
        let requestModel = RegisterUser(baseUrl: baseUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Register {
    

    
    struct RegisterUser: RequestRouter {
        var baseUrl: URL
        var user: User!
        var method: HTTPMethod = .post
        
        var path: String = "register"
        
        var parameters: Parameters? {
            let params: Parameters = [
                "id": user.id,
                "username": user.username,
                "email": user.email,
                "password": user.password,
                "bio": user.bio,
                "gender": user.gender,
                "credit_card": user.credit_card
                
            ]
            return params
        }
        
    }
}
