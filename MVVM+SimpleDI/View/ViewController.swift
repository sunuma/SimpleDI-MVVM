//
//  ViewController.swift
//  MVVM+SimpleDI
//
//  Created by ShinUnuma on 2019/02/17.
//  Copyright © 2019年 ShinUnuma. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    internal var disposeBag = DisposeBag()

    func subscribe<T>(_ observer: Observable<T>, completion: @escaping (T) -> Void) {
        observer.observeOn(MainScheduler.instance).subscribe(onNext: { value in
            completion(value)
        }).disposed(by: disposeBag)
    }
    
    func presetntAlert(title: String? = nil, msg: String? = nil) {
        let alert: UIAlertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "キャンセル", style: .cancel)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
}

