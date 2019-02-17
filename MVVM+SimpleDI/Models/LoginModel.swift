//
//  LoginModel.swift
//  MVVM+SimpleDI
//
//  Created by ShinUnuma on 2019/02/17.
//  Copyright © 2019年 ShinUnuma. All rights reserved.
//

import Foundation

protocol LoginModelProtocol {
    static func fetch(userId: String, password: String, completion: (_ result: ResultType<LoginModel, APIError>) -> Void)
}

struct LoginModel: LoginModelProtocol {
    private(set) var sessionId: String
    
    static func fetch(userId: String, password: String, completion: (_ result: ResultType<LoginModel, APIError>) -> Void) {
        if userId != "" && password != "" {
            completion(.success(LoginModel(sessionId: "1234567890")))
        } else {
            completion(.failed(.unknown("User ID と Password を入力してください")))
        }
    }
}
