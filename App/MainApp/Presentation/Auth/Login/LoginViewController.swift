//
//  LoginViewController.swift
//  SuperChatApp
//
//  Created by Farhandika on 01/04/22.
//

import UIKit
import SwiftUI

class LoginViewController: BaseViewController {
    
    lazy var emailTextField:UITextField = {
        // insantiasi class uitextfield dan membuat objek textfield
        let textField = UITextField()
        // memberi akses untuk membuat constraints sendiri programatically
        textField.translatesAutoresizingMaskIntoConstraints = false
        // CSS
        textField.placeholder = "Email"
        textField.borderStyle = .none
        textField.backgroundColor = .lightGray
        // nambah corner radius agar bulet
        textField.layer.cornerRadius = 20
        textField.layer.masksToBounds = true
        // nambah view dummy sebagai padding kanan kiri
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: textField.frame.height))
        textField.rightViewMode = .always
        // center placeholder
        // vertical alignment
        textField.contentVerticalAlignment = .center

        // horizontal alignment
        textField.textAlignment = .center

        
        return textField
    }()
    
    lazy var passwordTextField:UITextField = {
        let textField = UITextField()
        //let dummyPadding = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: textField.frame.height))
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.placeholder = "Password"
        textField.borderStyle = .none
        textField.backgroundColor = .lightGray

        
        textField.layer.cornerRadius = 20
        textField.layer.masksToBounds = true
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: textField.frame.height))
        textField.leftViewMode = .always
        
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: textField.frame.height))
        textField.rightViewMode = .always
        
        textField.isSecureTextEntry = true
        
        //textField.contentVerticalAlignment = .center
        
        textField.textAlignment = .center
        
        return textField
    }()
    
    lazy var WelcomeLabel:UILabel = {
        
        let attributedText = NSMutableAttributedString(string: "Welcome\n", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 32)])
        
        attributedText.append(NSAttributedString(string: "Log in to continue!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24), NSAttributedString.Key.foregroundColor: UIColor.systemGray]))
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.attributedText = attributedText
        label.textAlignment = .left
        label.numberOfLines = 2
        
        
        return label
    }()
    
    let LoginButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .justBlue
        
        
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true // agar layer terapply
        
        return button
    }()
    
    lazy var registerLabel:UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "Didn’t have an account?", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)])
        
        attributedText.append(NSAttributedString(string: " Sign Up!",attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.justBlue]))
        label.attributedText = attributedText
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        return label
    }()
    
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
        // add subview to view
        
        LoginButton.addTarget(self, action: #selector(self.didTapLogin(_:)), for: .touchUpInside)
        view.addSubview(WelcomeLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(LoginButton)
        self.setupRegisterLabel()
        
        // add constraint
        NSLayoutConstraint.activate([
            WelcomeLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 160),
            WelcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 51),
            WelcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -112),
        
            emailTextField.topAnchor.constraint(equalTo: WelcomeLabel.bottomAnchor,constant: 50),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 51),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -51),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.widthAnchor.constraint(greaterThanOrEqualToConstant: 274),
            
            emailTextField.heightAnchor.constraint(equalToConstant: 49),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 19),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 51),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -51),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.widthAnchor.constraint(greaterThanOrEqualToConstant: 274),
            passwordTextField.heightAnchor.constraint(equalToConstant: 49),
            
            LoginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 19),
            LoginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -51),
            LoginButton.widthAnchor.constraint(equalToConstant: 126),
            LoginButton.heightAnchor.constraint(equalToConstant: 49),
            
            //168
            self.registerLabel.topAnchor.constraint(lessThanOrEqualTo: self.LoginButton.bottomAnchor, constant: 168),
            self.registerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.registerLabel.widthAnchor.constraint(equalToConstant: self.view.bounds.width - 20)
            
        ])

        // Do any additional setup after loading the view.
    }
    
    @objc func didTapLogin(_ sender: UIButton) {
       viewModel.tryToLoginWithEmail(email: emailTextField.text, password: passwordTextField.text)
    }
    
    @objc func didTapSignUp(_ sender:UIButton) {
        viewModel.tryToSignUp()
    }
    
    private func setupRegisterLabel() {
        self.view.addSubview(self.registerLabel)
        self.registerLabel.isUserInteractionEnabled = true
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(tappedOnLabel(_ :)))
        tapgesture.numberOfTapsRequired = 1
        self.registerLabel.addGestureRecognizer(tapgesture)
    }
    
    //MARK:- tappedOnLabel
        @objc func tappedOnLabel(_ gesture: UITapGestureRecognizer) {
            guard let text = self.registerLabel.text else { return }
            let range = (text as NSString).range(of: " Sign Up!")
            if gesture.didTapAttributedTextInLabel(label: self.registerLabel, inRange: range) {
                let vc = RegisterViewController()
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true, completion: nil)
            }
        }
    
    
}

extension LoginViewController:LoginVMOutput {
    func didSuccessAuth() {
        let vc = HomeViewController(nibName: "HomeViewController", bundle: nil)
        self.navigationController?.setViewControllers([vc], animated: true)
    }
    
    func didFailAuth(error:Error) {
        self.showNotification(message: error.localizedDescription)
        hideNotification(isInstant: false)
    }
    
    func gotoSignUp() {
        // let vc =
        // navi push vc
    }
}
