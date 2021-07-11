//
//  DesignView.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 10/07/2021.
//

import Foundation
import UIKit

@IBDesignable class DesignView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0
    @IBInspectable var shadowColor: UIColor? = ThemeManager.currentTheme().borderColor
    @IBInspectable var shadowOffSetWidth: Int = 0
    @IBInspectable var shadowOffSetheight: Int = 0
    @IBInspectable var shadowOpacity : Float = 0.2
    
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetheight)
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = shadowOpacity
    }
}

