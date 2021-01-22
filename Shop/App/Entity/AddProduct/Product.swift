//
//  Product.swift
//  Shop
//
//  Created by Максим Вечирко on 19.01.2021.
//  Copyright © 2021 Максим Вечирко. All rights reserved.
//

import Foundation

struct Product: Decodable {
    var product_name: String
    var amount: Int
    var quantity: Int
}

