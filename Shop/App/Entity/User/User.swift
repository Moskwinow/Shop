//
//  User.swift
//  Shop
//
//  Created by Максим Вечирко on 20.12.2020.
//  Copyright © 2020 Максим Вечирко. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: Int
    let username: String
    let email: String
    let password: String
    let bio: String
    let gender: String
    let credit_card: String
}
