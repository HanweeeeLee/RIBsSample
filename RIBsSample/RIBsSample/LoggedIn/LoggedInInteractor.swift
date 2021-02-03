//
//  LoggedInInteractor.swift
//  RIBsSample
//
//  Created by hanwe on 2021/02/03.
//

import RIBs
import RxSwift

protocol LoggedInRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol LoggedInPresentable: Presentable {
    var listener: LoggedInPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
    var detachObservable: Observable<Void> { get }
}

protocol LoggedInListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    func detachLoggedInRIB()
    func switchLoggedInToLoggedOut()
}

final class LoggedInInteractor: PresentableInteractor<LoggedInPresentable>, LoggedInInteractable, LoggedInPresentableListener {

    weak var router: LoggedInRouting?
    weak var listener: LoggedInListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: LoggedInPresentable) {
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
private extension LoggedInInteractor {
  func bindPresenter() {
    presenter.detachObservable
      .bind { [weak self] _ in
//        self?.listener?.detachLoggedInRIB()
        self?.listener?.switchLoggedInToLoggedOut()
    }
    .disposeOnDeactivate(interactor: self)
  }
}
