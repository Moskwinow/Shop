//
//  RegisterBuilder.swift
//  Shop
//
//  Created by Максим Вечирко on 22.01.2021.
//  Copyright © 2021 Максим Вечирко. All rights reserved.
//

import UIKit

class RegisterBuilder: AbstractBuilder {
    
    func createModule() -> Any {
        let view = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
        view.viewModel = RegisterViewModel(requestFactory: RequestFactory())
        
        return view as UIViewController
    }
    
    
}
