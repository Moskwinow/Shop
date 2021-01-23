//
//  ProductBuilder.swift
//  Shop
//
//  Created by Максим Вечирко on 23.01.2021.
//  Copyright © 2021 Максим Вечирко. All rights reserved.
//

import UIKit

class ProductBuilder: AbstractBuilder {
    
    
    func createModule() -> Any {
        let view = ProductViewController(nibName: "ProductViewController", bundle: nil)
        let viewModel = ProductViewModel(requestFactory: RequestFactory())
        view.viewModel = viewModel
        return view
    }
    
    
}
