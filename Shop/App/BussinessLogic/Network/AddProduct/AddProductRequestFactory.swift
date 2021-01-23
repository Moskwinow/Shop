//
//  AddProductRequestFactory.swift
//  Shop
//
//  Created by Максим Вечирко on 19.01.2021.
//  Copyright © 2021 Максим Вечирко. All rights reserved.
//

import Alamofire

protocol AddProductRequestFactory {
    func addProduct(product: Product, completionHandler: @escaping(AFDataResponse<ProductResult>) -> ())
}
