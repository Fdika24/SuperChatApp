//
//  ChatViewController.swift
//  SuperChatApp
//
//  Created by Farhandika on 01/04/22.
//

import UIKit

class ChatViewController: BaseViewController {
    
    var viewModel:ChatViewModel!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        ChatViewModel.configure(viewController: self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        ChatViewModel.configure(viewController: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapAddUser() {
        viewModel.addNewUser()
    }

    @IBAction func didTapSearch(_ sender: Any) {
        
        viewModel.searchUser()
    }
}

extension ChatViewController:ChatVMOutput {
    
}
