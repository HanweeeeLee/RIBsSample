//
//  LoggedInViewController.swift
//  RIBsSample
//
//  Created by hanwe on 2021/02/03.
//

import RIBs
import RxSwift
import UIKit
import RxCocoa

protocol LoggedInPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class LoggedInViewController: UIViewController, LoggedInPresentable, LoggedInViewControllable {
    
    //MAKR: Interface Builder
    @IBOutlet weak var logOutBtn: UIButton!

    //MARK: property
    weak var listener: LoggedInPresentableListener?
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
        logOutBtn.rx.tap
          .bind(to: detachRelay)
          .disposed(by: disposeBag)
    }

    //MARK: action
    
}
