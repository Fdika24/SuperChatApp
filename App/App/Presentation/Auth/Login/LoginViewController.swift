//
//  LoginViewController.swift
//  SuperChatApp
//
//  Created by Farhandika on 01/04/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        errorLabel.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapLogin(_ sender: Any) {
        NetworkManager.requestLogin { [weak self] hasil in
            guard let self = self else {return}
            switch hasil {
            case .success(_):
                let vc = HomeViewController(nibName: "HomeViewController", bundle: nil)
                self.navigationController?.pushViewController(vc, animated: true)
            case .failure(_):
                self.errorLabel.isHidden = false
            }
        }
    }
    
}
