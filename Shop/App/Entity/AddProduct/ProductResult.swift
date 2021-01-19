//
//  ProductResult.swift
//  Shop
//
//  Created by Максим Вечирко on 19.01.2021.
//  Copyright © 2021 Максим Вечирко. All rights reserved.
//

import Foundation

struct ProductResult: Decodable {
    let result: Int
    let user_message: String?
    let error_message: String?
}
