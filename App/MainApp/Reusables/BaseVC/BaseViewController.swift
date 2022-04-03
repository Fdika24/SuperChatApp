//
//  BaseViewController.swift
//  SuperChatApp
//
//  Created by Farhandika on 01/04/22.
//

import UIKit
import FluentUI

class BaseViewController:UIViewController {
    
    lazy var notificationView:NotificationView = {
        let notif = NotificationView()
        notif.translatesAutoresizingMaskIntoConstraints = false
        return notif
    }()
    
    
    func showNotification(message:String) {
        notificationView.setup(
            style: .primaryToast,
            message: message,
            action: { [unowned self] in
                self.hideNotification(isInstant: true)
            })
        if view.subviews.contains(notificationView) {
            notificationView.isHidden = false
        } else {
            view.addSubview(notificationView)
            NSLayoutConstraint.activate([
                notificationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                notificationView.heightAnchor.constraint(equalToConstant: 50),
                notificationView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-20),
                notificationView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 10),
                notificationView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -10)
            ])
        }
    }
    
    func hideNotification(isInstant:Bool){
        if isInstant {
            self.notificationView.isHidden = true
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.notificationView.isHidden = true
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func navigateToAuthView() {
        let vc = LoginViewController(nibName: "LoginViewController", bundle: nil)
        self.navigationController?.setViewControllers([vc], animated: true)
    }
}
