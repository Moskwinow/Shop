//
//  LoginBuilder.swift
//  Shop
//
//  Created by Максим Вечирко on 22.01.2021.
//  Copyright © 2021 Максим Вечирко. All rights reserved.
//

import UIKit


class LoginBuilder: AbstractBuilder {
    
     func createModule() -> Any {
        let view = LoginViewController(nibName: "LoginViewController", bundle: nil)
        let navigation = UINavigationController(rootViewController: view)
        let viewModel = LoginViewModel(requestFactory: RequestFactory(), builder: RegisterBuilder())
        view.viewModel = viewModel
        return navigation
    }
}
