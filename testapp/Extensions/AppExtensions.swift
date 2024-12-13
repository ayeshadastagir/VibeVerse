//
//  AppExtensions.swift
//  VibeVersaProject
//
//  Created by Ali on 01/12/2024.
//

import Foundation
import UIKit

extension Int{
    var autoSized : CGFloat{
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        let diagonalSize = sqrt((screenWidth * screenWidth) + (screenHeight * screenHeight))
        let percentage = CGFloat(self)/987*100 //987 is the diagonal size of iphone xs max
        return diagonalSize * percentage / 100
    }
    
    var widthRatio: CGFloat {
        let width = UIScreen.main.bounds.width/414.0 //iphone xs max
        return CGFloat(self)*width
    }
    
}

extension UIColor {
    
    @nonobjc class var beige: UIColor {
        return UIColor(red: 255/255, green: 247/255, blue: 208/255, alpha: 1.0)
    }
    @nonobjc class var brown: UIColor {
        return UIColor(red: 76/255, green: 61/255, blue: 61/255, alpha: 1.0)
    }
    @nonobjc class var yellow: UIColor {
        return UIColor(red: 255/255, green: 199/255, blue: 0/255, alpha: 1.0)
    }
    @nonobjc class var darkBeige: UIColor {
        return UIColor(red: 251/255, green: 234/255, blue: 160/255, alpha: 1.0)
    }
    @nonobjc class var customBrown: UIColor {
        return UIColor(red: 184/255, green: 150/255, blue: 83/255, alpha: 1.0)
    }
    @nonobjc class var pastelBeige: UIColor {
        return UIColor(red: 255/255, green: 233/255, blue: 170/255, alpha: 1.0)
    }
    
}

