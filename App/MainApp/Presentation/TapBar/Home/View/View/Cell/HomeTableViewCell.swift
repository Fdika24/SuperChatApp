//
//  HomeTableViewCell.swift
//  SuperChatApp
//
//  Created by Farhandika on 03/04/22.
//

import Kingfisher
import UIKit

class HomeTableViewCell: UITableViewCell {
    
    public static let identifier = "HomeTableViewCell"
    
    @IBOutlet weak var avatarImageView:UIImageView!
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var contentLabel:UILabel!
    @IBOutlet weak var bottomView: UIView!
    override
    func awakeFromNib() {
        super.awakeFromNib()
        self.avatarImageView.setRounded()
        
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.bottomAnchor.constraint(lessThanOrEqualTo: avatarImageView.bottomAnchor).isActive = true
        contentLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
    }
    
    public func setupContent(imageURL:String, name:String, content:String) {
        let url = URL(string: imageURL)
        self.avatarImageView.kf.setImage(
            with: url, placeholder: UIImage(systemName: "person.circle.fill"), completionHandler: nil)
        self.nameLabel.text = name
        self.contentLabel.text = content
    }
    
}
