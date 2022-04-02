//
//  HomeViewController.swift
//  SuperChatApp
//
//  Created by Farhandika on 01/04/22.
//

import UIKit
import FluentUI

class HomeViewController: BaseViewController {
    
    let cellIdentifier = "contentCell"
    
    @IBOutlet weak var tableView:UITableView!
    
    var viewModel:HomeViewModel!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupViewModel()
    }
    
    private func setupViewModel() {
        HomeViewModel.configure(viewControler: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.hidesBackButton = true
        self.title = "Home"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutDidTapped))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
    
    private func setupTableView() {
        /// assigning up tableview delegate and data source
        self.tableView.delegate = self
        self.tableView.dataSource = self
        /// register tableview cell
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    @objc func logoutDidTapped() {
        viewModel.tryToLogout()
    }
}

extension HomeViewController:HomeVMOutput {
    func didSuccessLogout() {
        self.navigateToAuthView()
    }
    
    func didFailLogout() {
        self.showNotification(message: "Log-out fails")
    }
    
    func setupViews() {
        self.setupTableView()
    }
    
    func didFinnishFetchData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            HUD.shared.hide()
            self.showNotification(message: "Log-in successfully")
            self.tableView.reloadData()
        }
        hideNotification(isInstant: false)
    }
    
    func startLoading() {
        HUD.shared.show(in: view, with: HUDParams(caption: "Loading content..."))
    }
    
}
