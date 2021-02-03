//
//  RootInteractor.swift
//  RIBsSample
//
//  Created by hanwe on 2021/02/03.
//

import RIBs
import RxSwift

protocol RootRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func detachLoggedOutRIB()
    func detachLoggedInRIB()
    func attatchLoggedInRIB()
    func attatchLoggedOutRIB()
}

protocol RootPresentable: Presentable {
    var listener: RootPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol RootListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class RootInteractor: PresentableInteractor<RootPresentable>, RootInteractable, RootPresentableListener {

    weak var router: RootRouting?
    weak var listener: RootListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: RootPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}

extension RootInteractor {
    func detachLoggedOutRIB() {
        print("detachLoggedOutRIB?")
        self.router?.detachLoggedOutRIB()
    }
    
    func detachLoggedInRIB() {
        print("detachLoggedInRIB?")
        self.router?.detachLoggedInRIB()
    }
    
    func switchLoggedInToLoggedOut() {
        print("switchLoggedInToLoggedOut")
        self.router?.detachLoggedInRIB()
//        self.router?.attatchLoggedOutRIB()
    }
    
    func switchLoggedOutToLoggedIn() {
        print("switchLoggedOutToLoggedIn")
        self.router?.detachLoggedOutRIB()
//        self.router?.attatchLoggedInRIB()
    }
}
