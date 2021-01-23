//
//  LoginViewModel.swift
//  Shop
//
//  Created by Максим Вечирко on 22.01.2021.
//  Copyright © 2021 Максим Вечирко. All rights reserved.
//

import Foundation

enum Success {
    case success(String?)
    case failure(String?)
}


class LoginViewModel {
    
    var model: LoginResult?
    var requestFactory: RequestFactory
    let builder: AbstractBuilder
    typealias Results = Success
    
    init(requestFactory: RequestFactory, builder: AbstractBuilder) {
        self.requestFactory = requestFactory
        self.builder = builder
    }
    
    func login(email: String, password: String, complate: @escaping(Results) -> ()) {
        let request = requestFactory.makeAuthRequestFactory()
        request.login(userName: email, password: password) { (result) in
            switch result.result {
            case .success(let model):
                self.model = model
                if model.error_message == nil {
                    complate(.success(model.user_massage))
                } else {
                    complate(.failure(model.error_message))
                }
            case .failure(let error):
                complate(.failure(error.errorDescription))
            }
        }
    }
    
}
