//
//  Logout.swift
//  Shop
//
//  Created by Максим Вечирко on 20.12.2020.
//  Copyright © 2020 Максим Вечирко. All rights reserved.
//

import Alamofire

class Logout: AbstractRequestFactory {
    
    var errorParser: AbstractErrorParser
    var sessionManager: Session
    var queue: DispatchQueue
    let baseURL = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
    
    
}

extension Logout: LogoutRequestFactory {
    func logout(completionHandler: @escaping (AFDataResponse<LogoutResult>) -> ()) {
        let requestModel = Exit(baseUrl: baseURL)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
}

extension Logout  {
    
    struct Exit: RequestRouter {
        
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "logout.json"
        var parameters: Parameters?

    }
    
}
