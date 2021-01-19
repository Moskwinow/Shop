//
//  RequestFactory.swift
//  Shop
//
//  Created by Максим Вечирко on 20.12.2020.
//  Copyright © 2020 Максим Вечирко. All rights reserved.
//

import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let config = URLSessionConfiguration.default
        config.httpShouldSetCookies = false
        config.headers = .default
        let manager = Session(configuration: config)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFactory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeLogOutRequestFactory() -> LogoutRequestFactory {
        let errorParser = makeErrorParser()
        return Logout(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeUpdatingFactory() -> UpdateUserFactory {
           let errorParser = makeErrorParser()
        return UpdateUser(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeRegisterUserFactory() -> RegisterRequestFactory {
        let errorParser = makeErrorParser()
        return Register(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func addProduct() -> AddProductRequestFactory {
        let errorParser = makeErrorParser()
        return AddProduct(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
}
