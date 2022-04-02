//
//  LoginViewController.swift
//  SuperChatApp
//
//  Created by Farhandika on 01/04/22.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var emailTextField:UITextField!
    @IBOutlet weak var passwordTextField:UITextField!
    
    var viewModel:LoginViewModel!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        LoginViewModel.configure(viewController: self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        LoginViewModel.configure(viewController: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapLogin(_ sender: Any) {
        viewModel.tryToLoginWithEmail(email: emailTextField.text, password: passwordTextField.text)
    }
    
}

extension LoginViewController:LoginVMOutput {
    func didSuccessAuth() {
        let vc = HomeViewController(nibName: "HomeViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func didFailAuth(error:Error) {
        self.showNotification(message: error.localizedDescription)
        hideNotification(isInstant: false)
    }
}
