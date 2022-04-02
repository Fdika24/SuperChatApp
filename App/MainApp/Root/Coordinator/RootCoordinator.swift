//
//  RootCoordinator.swift
//  RootCoordinatorTemplate
//
//  Created by Farhandika on 26/03/22.
//

import UIKit
import Firebase

class RootCoordinator {
    var window:UIWindow?
    
    private let navigationController = UINavigationController()
    
    init(window:UIWindow?){
        self.window = window
        self.window?.rootViewController = navigationController
    }
    
    public func start() {
        self.checkLastState()
        window?.makeKeyAndVisible()
    }
    
    public func configureApp() {
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
    }
    
    //TODO: REWORK
    private func checkLastState() {
        if NetworkConstant.isLogin() {
            navigateToHome()
        } else {
            navigateToAuth()
        }
    }
    
    private func navigateToAuth() {
        /// change if needed, this will be your initial view controller
        let vc = LoginViewController(nibName: "LoginViewController", bundle: nil)
        navigationController.pushViewController(vc, animated: true)
    }
    
    private func navigateToHome() {
        let vc = HomeViewController(nibName: "HomeViewController", bundle: nil)
        navigationController.pushViewController(vc, animated: true)
    }
    
}
