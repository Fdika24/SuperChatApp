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
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell
        cell.setContent(
            imageURl: "https://media-exp1.licdn.com/dms/image/C4E03AQH5qLZIO7eFng/profile-displayphoto-shrink_400_400/0/1601346639038?e=1654128000&v=beta&t=4HmsO1IIR5q4YfxWi90WaejMj1RbgLivNmZnNSerI28",
            groupName: "STI 2020",
            content: "Thoriq mau jadi kahim, pilih Thoriq!"
        )
        return cell
    }
    
    
}
