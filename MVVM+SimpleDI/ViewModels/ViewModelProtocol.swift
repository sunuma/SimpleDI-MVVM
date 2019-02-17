//
//  ViewModelProtocol.swift
//  MVVM+SimpleDI
//
//  Created by ShinUnuma on 2019/02/17.
//  Copyright © 2019年 ShinUnuma. All rights reserved.
//

import Foundation
import RxSwift

protocol TopViewModelProtocol {
    var userName: PublishSubject<String> { get }
    var address: PublishSubject<String> { get }
    var tel: PublishSubject<String> { get }
    var description: PublishSubject<String> { get }
    
    func fetch()
}

protocol LoginViewModelProtocol {
    var sessionId: PublishSubject<String> { get }
    var error: PublishSubject<APIError> { get }
    
    func fetch(userId: String, password: String)
}
