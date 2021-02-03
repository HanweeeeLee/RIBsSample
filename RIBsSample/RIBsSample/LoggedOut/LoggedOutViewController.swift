//
//  LoggedOutViewController.swift
//  RIBsSample
//
//  Created by hanwe on 2021/02/03.
//

import RIBs
import RxSwift
import UIKit

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
    
    //MAKR: life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("테스트")
        self.view.backgroundColor = .purple
    }
    
    //MARK: function
    
    //MARK: action
    @IBAction func loginAction(_ sender: Any) {
        print("test")
    }
}
