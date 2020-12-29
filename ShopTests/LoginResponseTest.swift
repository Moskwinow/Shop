//
//  LoginResponseTest.swift
//  ShopTests
//
//  Created by Максим Вечирко on 29.12.2020.
//  Copyright © 2020 Максим Вечирко. All rights reserved.
//

import XCTest
import Alamofire
@testable import Shop

class AuthSub: Auth {
    
}

class RequestFactorySub: RequestFactory {
    func makeAuthSub() -> AuthRequestFactory {
       AuthSub(errorParser: makeErrorParser(), sessionManager: commonSession, queue: sessionQueue)
    }
}


class LoginResponseTest: XCTestCase {
    var requestFactorySub: RequestFactorySub!
    let nameSub: String = ""
    let passwordSub: String = "User"
    override func setUpWithError() throws {
        try super.setUpWithError()
        requestFactorySub = RequestFactorySub()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        requestFactorySub = nil
    }
    
    func testShouldMakeLogin() {
        let login = requestFactorySub.makeAuthSub()
        let expectation = XCTestExpectation(description: "Download https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")
        
        login.login(userName: nameSub, password: passwordSub) { (result) in
            switch result.result {
            case .success(_): break
            case .failure:
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
        
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
