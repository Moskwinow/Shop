//
//  ResponseDecodableTest.swift
//  ShopTests
//
//  Created by Максим Вечирко on 29.12.2020.
//  Copyright © 2020 Максим Вечирко. All rights reserved.
//

import XCTest
@testable import Shop
import Alamofire

struct PostStub: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

enum ApiErrorSub: Error {
    case fatalError
}

struct ErrorParserSub: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return ApiErrorSub.fatalError
    }
    
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
   
}

class ResponseDecodableTest: XCTestCase {
    
    let expectationTests = XCTestExpectation(description: "Download https://jsonplaceholder.typicode.com/posts/1")
    var errorParser: ErrorParserSub!

    override func setUpWithError() throws {
        try super.setUpWithError()
        errorParser = ErrorParserSub()
    }
    
    

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        errorParser = nil
    }

    func testShouldDownloadAndParse() {
        let errorParser = ErrorParserSub()
        
        AF.request("https://jsonplaceholder.typicode.com/posts/1").responseCodable(errorParser: errorParser) { (response: DataResponse<PostStub, AFError>) in
            
            switch response.result {
            case .success(_): break
            case .failure:
                XCTFail()
            }
            self.expectationTests.fulfill()
        }
        wait(for: [expectationTests], timeout: 10.0)
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
