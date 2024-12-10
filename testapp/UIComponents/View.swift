//
//  View.swift
//  UIComponents
//
//  Created by Ali on 30/10/2024.
//

import Foundation
import UIKit

class View: UIView {
    
    init(backgroundcolor:UIColor, cornerradius:CGFloat = 0) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundcolor
        self.layer.cornerRadius = cornerradius
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIView {
    func addDashedBorder(_ color: UIColor = UIColor.beige, withWidth width: CGFloat = 1.autoSized, dashPattern: [NSNumber] = [18, 18]) {
        self.layer.sublayers?.removeAll(where: { $0 is CAShapeLayer })
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = width
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = dashPattern
        shapeLayer.fillColor = nil
        shapeLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        shapeLayer.frame = self.bounds
        self.layer.addSublayer(shapeLayer)
    }
    func addBottomShadow(color: UIColor = .gray,
                         opacity: Float = 1,
                         shadowRadius: CGFloat = 4,
                         shadowOffset: CGSize = CGSize(width: 0, height: 3)) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = shadowOffset
        layer.masksToBounds = false
    }
}

