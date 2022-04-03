//
//  HomeViewModel.swift
//  SuperChatApp
//
//  Created by Farhandika on 01/04/22.
//

import Foundation

protocol HomeVMOutput {
    func setupViews()
    func didFinnishFetchData()
    func startLoading()
    
    func didSuccessLogout()
    func didFailLogout()
}

class HomeViewModel {
    
    let output:HomeVMOutput
    
    var data:[Int] = []
    
    var count:Int {
        return data.count
    }
    
    let networkManager = NetworkManager()
    
    static func configure(viewControler vc:HomeViewController) {
        let vm = HomeViewModel(output: vc)
        vc.viewModel = vm
    }
    
    private init(output:HomeVMOutput){
        self.output = output
    }
    
    public func viewDidLoad() {
        output.startLoading()
        output.setupViews()
        self.fetchChatData()
    }
    
    private func fetchChatData() {
        data = [1,2,3,4,5]
        output.didFinnishFetchData()
    }
    
    public func tryToLogout() {
        networkManager.requestlogout { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(_):
                self.output.didSuccessLogout()
            case .failure(_):
                self.output.didFailLogout()
            }
        }
    }
}
