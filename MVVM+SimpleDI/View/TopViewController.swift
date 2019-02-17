//
//  TopViewController.swift
//  MVVM+SimpleDI
//
//  Created by ShinUnuma on 2019/02/17.
//  Copyright © 2019年 ShinUnuma. All rights reserved.
//

import Foundation
import UIKit

class TopViewController: ViewController, ViewModelInjection {
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var tel: UILabel!
    @IBOutlet weak var userDescription: UITextView!
    
    typealias ViewModel = TopViewModelProtocol?
    private(set) var viewModel: ViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
    }
    
    func inject(viewModel: ViewModel) {
        self.viewModel = viewModel
        guard let vm = self.viewModel else { return }
        subscribe(vm.userName) { userName in
            self.userName.text = userName
        }
        subscribe(vm.address) { address in
            self.address.text = address
        }
        subscribe(vm.tel) { tel in
            self.tel.text = tel
        }
        subscribe(vm.description) { description in
            self.userDescription.text = description
        }
    }
    
    private func fetch() {
        viewModel?.fetch()
    }
}
