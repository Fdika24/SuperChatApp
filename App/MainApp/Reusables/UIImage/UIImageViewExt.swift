//
//  UIImageViewExt.swift
//  SuperChatApp
//
//  Created by Farhandika on 02/04/22.
//

import UIKit

extension UIImageView {
    func makeRounded() {
        let radius = self.frame.width / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
