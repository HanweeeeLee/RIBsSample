//
//  LoggedOutBuilder.swift
//  RIBsSample
//
//  Created by hanwe on 2021/02/03.
//

import RIBs

protocol LoggedOutDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class LoggedOutComponent: Component<LoggedOutDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol LoggedOutBuildable: Buildable {
    func build(withListener listener: LoggedOutListener) -> LoggedOutRouting
}

final class LoggedOutBuilder: Builder<LoggedOutDependency>, LoggedOutBuildable {

    override init(dependency: LoggedOutDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: LoggedOutListener) -> LoggedOutRouting {
        let component = LoggedOutComponent(dependency: dependency)
        let board = UIStoryboard(name: "LoggedOutViewController", bundle: nil)
        let viewController = board.instantiateViewController(identifier: "LoggedOutViewController")
        let interactor = LoggedOutInteractor(presenter: viewController as! LoggedOutPresentable)
        interactor.listener = listener
        return LoggedOutRouter(interactor: interactor, viewController: viewController as! LoggedOutViewControllable)
    }
}

//let board = UIStoryboard(name: “Main”, bundle: nil)
//let vc = board.instantiateViewController(withIdentifier: “idTabBar”)
//self.present(vc, animated: true, completion: nil)
