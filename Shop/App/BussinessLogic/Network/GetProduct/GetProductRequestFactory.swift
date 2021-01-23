//
//  GetProductRequestFactory.swift
//  Shop
//
//  Created by Максим Вечирко on 23.01.2021.
//  Copyright © 2021 Максим Вечирко. All rights reserved.
//

import Alamofire

protocol GetProductRequestFactory {
    func getProduct(complate: @escaping(AFDataResponse<[Product]>) -> ())
}
