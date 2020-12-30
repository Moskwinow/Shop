//
//  RegisterRequestFactory.swift
//  Shop
//
//  Created by Максим Вечирко on 20.12.2020.
//  Copyright © 2020 Максим Вечирко. All rights reserved.
//

import Alamofire

protocol RegisterRequestFactory {
    func register(user: User, completionHandler: @escaping(AFDataResponse<RegisterResult>) -> ())
}
