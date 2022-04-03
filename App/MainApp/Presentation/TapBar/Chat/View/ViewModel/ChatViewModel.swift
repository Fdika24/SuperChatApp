//
//  ChatViewModel.swift
//  SuperChatApp
//
//  Created by Farhandika on 03/04/22.
//

import Foundation

protocol ChatVMOutput {
    
}

class ChatViewModel {
    let output:ChatVMOutput
    
    static func configure(viewController vc:ChatViewController){
        let vm = ChatViewModel(output: vc)
        vc.viewModel = vm
    }
    
    private init(output:ChatVMOutput) {
        self.output = output
    }
    
    func addNewUser() {
    }
    
    func searchUser() {
    }
}
