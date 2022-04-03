//
//  HomeVCDelegate.swift
//  SuperChatApp
//
//  Created by Farhandika on 01/04/22.
//

import UIKit

extension HomeViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
