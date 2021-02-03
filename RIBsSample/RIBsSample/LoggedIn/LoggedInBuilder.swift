//
//  LoggedInBuilder.swift
//  RIBsSample
//
//  Created by hanwe on 2021/02/03.
//

import RIBs

protocol LoggedInDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class LoggedInComponent: Component<LoggedInDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol LoggedInBuildable: Buildable {
    func build(withListener listener: LoggedInListener) -> LoggedInRouting
}

final class LoggedInBuilder: Builder<LoggedInDependency>, LoggedInBuildable {

    override init(dependency: LoggedInDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: LoggedInListener) -> LoggedInRouting {
        let component = LoggedInComponent(dependency: dependency)
        let board = UIStoryboard(name: "LoggedInViewController", bundle: nil)
        let viewController = board.instantiateViewController(identifier: "LoggedInViewController")
        let interactor = LoggedInInteractor(presenter: viewController as! LoggedInPresentable)
        interactor.listener = listener
        return LoggedInRouter(interactor: interactor, viewController: viewController as! LoggedInViewControllable)
    }
}
