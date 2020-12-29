//
//  UpdateUserFactory.swift
//  Shop
//
//  Created by Максим Вечирко on 20.12.2020.
//  Copyright © 2020 Максим Вечирко. All rights reserved.
//

import Alamofire

protocol UpdateUserFactory {
     func updateUser(completionHandler: @escaping(AFDataResponse<UpdateUserResult>) -> ())
}
