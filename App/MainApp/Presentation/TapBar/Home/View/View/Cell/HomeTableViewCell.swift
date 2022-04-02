//
//  HomeTableViewCell.swift
//  SuperChatApp
//
//  Created by Farhandika on 02/04/22.
//

import Kingfisher
import UIKit

class HomeTableViewCell: UITableViewCell {
    
    static let identifier = "HomeTableViewCell"
    
    @IBOutlet weak var groupImageView:UIImageView!
    @IBOutlet weak var groupLabel:UILabel!
    @IBOutlet weak var contentLabel:UILabel!
    @IBOutlet weak var fakeView:UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        groupImageView.makeRounded()
        fakeView.isHidden = true
    }
    
    public func setContent(imageURl:String, groupName:String, content:String) {
        let url = URL(string: imageURl)
        groupImageView.kf.setImage(
            with: url,
            placeholder: UIImage(systemName: "person.circle.fill"),
            completionHandler: nil)
        self.groupLabel.text = groupName
        self.contentLabel.text = content
        
    }
    
    
    
}
