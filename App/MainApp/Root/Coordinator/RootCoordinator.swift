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
        self.navigateToAuth()
        window?.makeKeyAndVisible()
    }
    
    public func configureApp() {
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
    }
    
    //TODO: REWORK
    private func checkLastState() {
        let network = NetworkManager()
        network.requestLogin(target: .email(email: UserDetail.email, password: UserDetail.password)) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(_):
                self.navigateToHome()
            case .failure(_) :
                self.navigateToAuth()
            }
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
