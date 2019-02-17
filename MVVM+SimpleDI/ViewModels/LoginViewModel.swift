//
//  LoginViewModel.swift
//  MVVM+SimpleDI
//
//  Created by ShinUnuma on 2019/02/17.
//  Copyright © 2019年 ShinUnuma. All rights reserved.
//

import Foundation
import RxSwift

class LoginViewModel: LoginViewModelProtocol {
    private(set) var sessionId = PublishSubject<String>()
    private(set) var error = PublishSubject<APIError>()
    private(set) var model: LoginModelProtocol.Type
    
    init(model: LoginModelProtocol.Type) {
        self.model = model
    }
    
    func fetch(userId: String, password: String) {
        model.fetch(userId: userId, password: password) { result in
            switch result {
            case let .success(result):
                self.sessionId.onNext(result.sessionId)
            case let .failed(error):
                self.error.onNext(error)
            }
        }
    }
}
