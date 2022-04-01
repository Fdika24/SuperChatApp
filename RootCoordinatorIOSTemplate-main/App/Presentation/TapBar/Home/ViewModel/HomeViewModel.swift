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
}

class HomeViewModel {
    
    let output:HomeVMOutput
    
    var data:[Int] = []
    
    var count:Int {
        return data.count
    }
    
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
}
