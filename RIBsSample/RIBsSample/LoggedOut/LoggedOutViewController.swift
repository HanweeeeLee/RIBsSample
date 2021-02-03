//
//  LoggedOutViewController.swift
//  RIBsSample
//
//  Created by hanwe on 2021/02/03.
//

import RIBs
import RxSwift
import UIKit
import RxCocoa

protocol LoggedOutPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {
    
    //MAKR: Interface Builder
    @IBOutlet weak var logInBtn: UIButton!
    
    //MARK: property
    weak var listener: LoggedOutPresentableListener?
    
    private let detachRelay: PublishRelay<Void> = .init()
    private let disposeBag: DisposeBag = .init()
    
    lazy var detachObservable: Observable<Void> = detachRelay.asObservable()
    
    //MAKR: life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .purple
        bindView()
    }
    
    //MARK: function
    
    func bindView() {
        logInBtn.rx.tap
          .bind(to: detachRelay)
          .disposed(by: disposeBag)
    }
    
    //MARK: action
    @IBAction func loginAction(_ sender: Any) {
        print("test")
    }
}
