//
//  RegisterViewController.swift
//  SuperChatApp
//
//  Created by Rey Shazni on 11/04/22.
//

import UIKit

class RegisterViewController: UIViewController {
    lazy var WelcomeLabel:UILabel = {
        
        let attributedText = NSMutableAttributedString(string: "Unlock more opportunities,\n", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30)])
        
        attributedText.append(NSAttributedString(string: "Create your new account!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.systemGray]))
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.attributedText = attributedText
        label.textAlignment = .left
        label.numberOfLines = 3
        
        
        return label
    }()
    
    lazy var nameTextField:UITextField = {
        // insantiasi class uitextfield dan membuat objek textfield
        let textField = UITextField()
        // memberi akses untuk membuat constraints sendiri programatically
        textField.translatesAutoresizingMaskIntoConstraints = false
        // CSS
        textField.placeholder = "Name"
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
    
    lazy var confirmPasswordTextField:UITextField = {
        let textField = UITextField()
        //let dummyPadding = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: textField.frame.height))
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.placeholder = "Confirm password"
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
    
    let signupButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = .justBlue
        
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true // agar layer terapply
       
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // add subview
        view.addSubview(WelcomeLabel)
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(confirmPasswordTextField)
        view.addSubview(signupButton)
        
        // add constraint
        NSLayoutConstraint.activate([
            // Welcome Label
            WelcomeLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 160),
            WelcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 51),
            WelcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -82),
            
            // Name Text Field
            nameTextField.topAnchor.constraint(equalTo: WelcomeLabel.bottomAnchor, constant: 68),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 51),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -51),
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.widthAnchor.constraint(greaterThanOrEqualToConstant: 274),
            nameTextField.heightAnchor.constraint(greaterThanOrEqualToConstant: 49),
            
            // Email Text Field
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor,constant: 19),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 51),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -51),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.widthAnchor.constraint(greaterThanOrEqualToConstant: 274),
            emailTextField.heightAnchor.constraint(equalToConstant: 49),
            
            // Password Text Field
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 19),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 51),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -51),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.widthAnchor.constraint(greaterThanOrEqualToConstant: 274),
            passwordTextField.heightAnchor.constraint(equalToConstant: 49),
            
            // Confirm Password Text Field
            confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 19),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 51),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -51),
            confirmPasswordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmPasswordTextField.widthAnchor.constraint(greaterThanOrEqualToConstant: 274),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 49),
            
            // Sign Up Button
            signupButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 19),
            signupButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -51),
            signupButton.widthAnchor.constraint(equalToConstant: 126),
            signupButton.heightAnchor.constraint(equalToConstant: 49)
        ])
    }
}
