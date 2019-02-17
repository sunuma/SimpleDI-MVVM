//
//  LoginViewController.swift
//  MVVM+SimpleDI
//
//  Created by ShinUnuma on 2019/02/17.
//  Copyright © 2019年 ShinUnuma. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class LoginViewController: ViewController, ViewModelInjection {
    @IBOutlet weak var userIDField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    typealias ViewModel = LoginViewModelProtocol?
    var viewModel: ViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inject(viewModel: LoginViewModel(model: LoginModel.self))
    }
    
    func inject(viewModel: ViewModel) {
        self.viewModel = viewModel
        guard let vm = self.viewModel else { return }
        subscribe(vm.sessionId) { [weak self] sessionId in
            self?.presentTopView(sessionId: sessionId)
        }
        subscribe(vm.error) {error in
            print("localizedDescription = \(error.localizedDescription)\n message = \(error.msg())")
            self.presetntAlert(msg: error.msg())
        }
    }
    
    func presentTopView(sessionId: String) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "Top") as? TopViewController else {
            return
        }
        let topViewModel = TopViewModel(model: TopModel.self)
        topViewModel.update(sessionId: sessionId)
        vc.inject(viewModel: topViewModel)
        present(vc, animated: true)
    }
    
    @IBAction func clickToTopButton() {
        guard let userId = userIDField.text else { return }
        guard let password = passwordField.text else { return }
        viewModel?.fetch(userId: userId, password: password)
    }
}
