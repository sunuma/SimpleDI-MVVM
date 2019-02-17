//
//  LoginTests.swift
//  MVVM+SimpleDITests
//
//  Created by ShinUnuma on 2019/02/17.
//  Copyright © 2019年 ShinUnuma. All rights reserved.
//

import XCTest
@testable import MVVM_SimpleDI

class LoginTests: XCTestCase {
    var mock: LoginModelMock!
    
    override func setUp() {
        super.setUp()
        mock = LoginModelMock()
    }

    override func tearDown() {
        mock = nil
        super.tearDown()
    }

    func testLoginModel() {
        let failedExpectation = expectation(description: "failed login model")
        var userId: String = ""
        var password: String = ""
        LoginModelMock.fetch(userId: userId, password: password) { result in
            switch result {
            case .success(_):
                XCTFail()
            case let .failed(error):
                XCTAssertEqual(error.msg(), "User ID と Password を入力してください")
            }
            failedExpectation.fulfill()
        }
        let successExpectation = expectation(description: "succes login model")
        userId = "test_taro"
        password = "test123"
        LoginModelMock.fetch(userId: userId, password: password) { result in
            switch result {
            case let .success(model):
                XCTAssertEqual(model.sessionId, "1234567890")
            case .failed(_):
                XCTFail()
            }
            successExpectation.fulfill()
        }
        wait(for: [failedExpectation, successExpectation], timeout: 5)
    }
}

class LoginModelMock: LoginModelProtocol {
    
    static func fetch(userId: String, password: String, completion: (ResultType<LoginModel, APIError>) -> Void) {
        if userId != "" && password != "" {
            completion(.success(LoginModel(sessionId: "1234567890")))
        } else {
            completion(.failed(.unknown("User ID と Password を入力してください")))
        }
    }
}
