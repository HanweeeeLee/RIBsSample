//
//  RootRouter.swift
//  RIBsSample
//
//  Created by hanwe on 2021/02/03.
//

import RIBs

protocol RootInteractable: Interactable, LoggedOutListener, LoggedInListener {
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
    var loggedInBuilder: LoggedInBuildable
    
    private var loggedOutRouter: LoggedOutRouting?
    private var loggedInRouter: LoggedInRouting?
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable, viewController: RootViewControllable, loggedOutBuilder: LoggedOutBuildable, loggedInBuilder: LoggedInBuilder) {
        self.loggedOutBuilder = loggedOutBuilder
        self.loggedInBuilder = loggedInBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        attatchLoggedOutRIB()
    }
}

extension RootRouter {
    
//    func attachLoggedOutRIB() {
//        let loggedOutRouter = self.loggedOutBuilder.build(withListener: self.interactor)
//        self.loggedOutRouter = loggedOutRouter
//        self.attachChild(loggedOutRouter)
//        self.viewController.present(viewController: loggedOutRouter.viewControllable)
//    }
    
    func detachLoggedOutRIB() {
        print("얍")
        guard let router = self.loggedOutRouter else { return }
        viewController.dismiss(viewController: router.viewControllable)
        detachChild(router)
        self.loggedOutRouter = nil
    }
    
//    func attachLoggedInRIB() {
//        let loggedInRouter = self.loggedInBuilder.build(withListener: self.interactor)
//        self.loggedInRouter = loggedInRouter
//        self.attachChild(loggedInRouter)
//        self.viewController.present(viewController: loggedInRouter.viewControllable)
//    }
    
    func detachLoggedInRIB() {
        print("얍")
        guard let router = self.loggedInRouter else { return }
        viewController.dismiss(viewController: router.viewControllable)
        detachChild(router)
        self.loggedInRouter = nil
    }
    
    func attatchLoggedInRIB() {
        let loggedInRouter = self.loggedInBuilder.build(withListener: self.interactor)
        self.loggedInRouter = loggedInRouter
        self.attachChild(loggedInRouter)
        self.viewController.present(viewController: loggedInRouter.viewControllable)
    }
    
    func attatchLoggedOutRIB() {
        let loggedOutRouter = self.loggedOutBuilder.build(withListener: self.interactor)
        self.loggedOutRouter = loggedOutRouter
        self.attachChild(loggedOutRouter)
        self.viewController.present(viewController: loggedOutRouter.viewControllable)
    }
}
