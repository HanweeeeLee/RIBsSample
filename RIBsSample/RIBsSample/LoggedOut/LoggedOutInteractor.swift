//
//  LoggedOutInteractor.swift
//  RIBsSample
//
//  Created by hanwe on 2021/02/03.
//

import RIBs
import RxSwift

protocol LoggedOutRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol LoggedOutPresentable: Presentable {
    var listener: LoggedOutPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
    var detachObservable: Observable<Void> { get }
}

protocol LoggedOutListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    func detachLoggedOutRIB()
    func switchLoggedOutToLoggedIn()
}

final class LoggedOutInteractor: PresentableInteractor<LoggedOutPresentable>, LoggedOutInteractable, LoggedOutPresentableListener {

    weak var router: LoggedOutRouting?
    weak var listener: LoggedOutListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: LoggedOutPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        bindPresenter()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}

// MARK: - Binding
private extension LoggedOutInteractor {
  func bindPresenter() {
    presenter.detachObservable
      .bind { [weak self] _ in
//        self?.listener?.detachLoggedOutRIB()
        self?.listener?.switchLoggedOutToLoggedIn()
    }
    .disposeOnDeactivate(interactor: self)
  }
}
