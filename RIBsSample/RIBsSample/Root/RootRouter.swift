//
//  RootRouter.swift
//  RIBsSample
//
//  Created by hanwe on 2021/02/03.
//

import RIBs

protocol RootInteractable: Interactable, LoggedOutListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func present(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    
    var loggedOutBuilder: LoggedOutBuildable
    
    private var loggedOutRouter: LoggedOutRouting?
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable, viewController: RootViewControllable, loggedOutBuilder: LoggedOutBuildable) {
        self.loggedOutBuilder = loggedOutBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        attachLoggedOutRIB()
    }
}

extension RootRouter {
    
    func attachLoggedOutRIB() {
        let loggedOutRouter = self.loggedOutBuilder.build(withListener: self.interactor)
        self.loggedOutRouter = loggedOutRouter
        self.attachChild(loggedOutRouter)
        self.viewController.present(viewController: loggedOutRouter.viewControllable)
    }
    
    func detachLoggedOutRIB() {
        print("얍")
        guard let router = self.loggedOutRouter else { return }
        viewController.dismiss(viewController: router.viewControllable)
        detachChild(router)
        self.loggedOutRouter = nil
    }
}
