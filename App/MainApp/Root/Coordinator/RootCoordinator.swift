//
//  RootCoordinator.swift
//  RootCoordinatorTemplate
//
//  Created by Farhandika on 26/03/22.
//

import UIKit

class RootCoordinator {
    var window:UIWindow?
    
    private let navigationController = UINavigationController()
    
    init(window:UIWindow?){
        self.window = window
        self.window?.rootViewController = navigationController
    }
    
    public func start() {
        self.initialNavigation()
        window?.makeKeyAndVisible()
    }
    
    private func initialNavigation() {
        /// change if needed, this will be your initial view controller
        let vc = LoginViewController(nibName: "LoginViewController", bundle: nil)
        navigationController.pushViewController(vc, animated: true)
    }
}
