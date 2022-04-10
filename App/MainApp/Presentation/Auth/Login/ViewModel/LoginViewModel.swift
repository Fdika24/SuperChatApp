//
//  LoginViewModel.swift
//  SuperChatApp
//
//  Created by Farhandika on 02/04/22.
//

import Foundation
import FirebaseAuth

protocol LoginVMOutput {
    func didSuccessAuth()
    func didFailAuth(error:Error)
    func gotoSignUp()
}

class LoginViewModel {
    static func configure(viewController vc:LoginViewController) {
        let vm = LoginViewModel(output: vc)
        vc.viewModel = vm
    }
    
    private let output:LoginVMOutput
    private let networkManager = NetworkManager()
    
    private init(output:LoginVMOutput) {
        self.output = output
    }
    
    func tryToLoginWithEmail(email:String?,password:String?) {
        if email == nil || password == nil { return }
        networkManager.requestLogin(
            target: .email(email: email!, password: password!)) {[weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(_):
                    self.output.didSuccessAuth()
                case .failure(let error):
                    self.output.didFailAuth(error: error)
                }
        }
    }
    
    func tryToLoginWithGoogle() {
        
    }
    
    private func tryToAuth() {
    
    }
    
    func tryToSignUp() {
        self.output.gotoSignUp()
    }
}
