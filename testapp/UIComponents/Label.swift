//
//  Label.swift
//  UIComponents
//
//  Created by Ali on 30/10/2024.
//

import Foundation
import UIKit

class Label: UILabel {
   init(texttitle: String = "", textcolor: UIColor, font: UIFont, numOflines: Int = 0, textalignment: NSTextAlignment = .center) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = texttitle
        self.textColor = textcolor
        self.font = font
//       UIFont(name: (font.fontName), size: CGFloat(Int(font.pointSize).autoSized))
        self.numberOfLines = numOflines
        self.textAlignment = textalignment
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
