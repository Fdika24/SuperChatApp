//
//  UIImageViewExt.swift
//  SuperChatApp
//
//  Created by Farhandika on 03/04/22.
//

import UIKit

extension UIImageView {
    func setRounded() {
        let radius = self.frame.width / 2
         self.layer.cornerRadius = radius
         self.layer.masksToBounds = true
    }
}
