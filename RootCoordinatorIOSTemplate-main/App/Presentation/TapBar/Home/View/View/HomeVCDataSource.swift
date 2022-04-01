//
//  HomeVCDataSource.swift
//  SuperChatApp
//
//  Created by Farhandika on 01/04/22.
//

import UIKit

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = "Cell row : \(indexPath.row) , section : \(indexPath.section)"
        return cell
    }
    
    
}
