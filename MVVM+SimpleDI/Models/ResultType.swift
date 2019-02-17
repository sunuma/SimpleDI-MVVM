//
//  ResultType.swift
//  MVVM+SimpleDI
//
//  Created by ShinUnuma on 2019/02/17.
//  Copyright © 2019年 ShinUnuma. All rights reserved.
//

import Foundation

enum ResultType<T, Error> {
    case success(T)
    case failed(Error)
}

enum APIError: Error {
    case unknown(String)
}

extension APIError {
    func msg() -> String {
        switch self {
        case let .unknown(message):
            return message
        }
    }
}

enum ValidationError: Error {
    case isEmpty(String)
}
