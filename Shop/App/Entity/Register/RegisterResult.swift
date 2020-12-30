//
//  RegisterResult.swift
//  Shop
//
//  Created by Максим Вечирко on 20.12.2020.
//  Copyright © 2020 Максим Вечирко. All rights reserved.
//

import Foundation

struct RegisterResult: Decodable {
    
    let result: Int
    let user_message: String?
    let error_message: String?
    
    
}
