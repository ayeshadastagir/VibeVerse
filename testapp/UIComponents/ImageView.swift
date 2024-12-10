//
//  ImageView.swift
//  UIComponents
//
//  Created by Ali on 30/10/2024.
//

import Foundation
import UIKit

class ImageView: UIImageView {
    init(imagetitle:String = "", imagecolor:UIColor = .clear) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.image = UIImage(named: imagetitle)
        self.tintColor = imagecolor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

