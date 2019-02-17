//
//  TopViewModel.swift
//  MVVM+SimpleDI
//
//  Created by ShinUnuma on 2019/02/17.
//  Copyright © 2019年 ShinUnuma. All rights reserved.
//

import Foundation
import RxSwift

class TopViewModel: TopViewModelProtocol {
    private(set) var model: TopModelProtocol.Type
    private(set) var sessionId: String?
    private(set) var userName = PublishSubject<String>()
    private(set) var address = PublishSubject<String>()
    private(set) var tel = PublishSubject<String>()
    private(set) var description = PublishSubject<String>()
    private(set) var topError = PublishSubject<APIError>()
    private(set) var emptyError = PublishSubject<ValidationError>()
    
    init(model: TopModelProtocol.Type) {
        self.model = model
    }
    
    func update(sessionId: String) {
        self.sessionId = sessionId
    }
    
    func fetch() {
        guard let sessionId = sessionId else {
            emptyError.onNext(.isEmpty("Session ID is empty"))
            return
        }
        model.fetch(sesstionId: sessionId) { result in
            switch result {
            case let .success(result):
                self.userName.onNext(result.userName)
                self.address.onNext(result.address)
                self.tel.onNext(result.tel)
                self.description.onNext(result.description)
            case let .failed(error):
                self.topError.onNext(error)
            }
        }
    }
}
