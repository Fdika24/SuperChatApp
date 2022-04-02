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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ChatViewController(nibName: "ChatViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
