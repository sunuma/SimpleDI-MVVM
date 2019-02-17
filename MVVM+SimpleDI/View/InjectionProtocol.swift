//
//  InjectionProtocol.swift
//  MVVM+SimpleDI
//
//  Created by ShinUnuma on 2019/02/17.
//  Copyright © 2019年 ShinUnuma. All rights reserved.
//

import Foundation

protocol ViewModelInjection {
    associatedtype ViewModel
    var viewModel: ViewModel { get }
    func inject(viewModel: ViewModel)
}
