//
//  TopModel.swift
//  MVVM+SimpleDI
//
//  Created by ShinUnuma on 2019/02/17.
//  Copyright © 2019年 ShinUnuma. All rights reserved.
//

import Foundation

protocol TopModelProtocol {
    static func fetch(sesstionId: String, completion: (_ result: ResultType<TopModel, APIError>) -> Void)
}

struct TopModel: TopModelProtocol {
    var userName: String
    var address: String
    var tel: String
    var description: String
    
    static func fetch(sesstionId: String, completion: (_ result: ResultType<TopModel, APIError>) -> Void) {
        print(#function)
        // success
        completion(.success(TopModel(userName: "Susuki Taro", address: "Tokyo", tel: "99999999999", description: "Description")))
        // failed
        //completion(.failed(.unknown("Top fetch error: ")))
    }
}
