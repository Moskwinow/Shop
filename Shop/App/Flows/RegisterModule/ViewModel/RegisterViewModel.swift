//
//  RegisterViewModel.swift
//  Shop
//
//  Created by Максим Вечирко on 22.01.2021.
//  Copyright © 2021 Максим Вечирко. All rights reserved.
//

import Foundation


class RegisterViewModel {
    var requestFactory: RequestFactory
    var model: RegisterResult?
    init(requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
    }
    
    func register(user: User, complate: @escaping(Bool) -> ()) {
        let register = requestFactory.makeRegisterUserFactory()
        register.register(user: user) { (result) in
            switch result.result {
            case .success(let model):
                self.model = model
                print(model)
                complate(true)
            case .failure(let error):
                print(error.localizedDescription)
                complate(false)
            }
        }
    }
}
