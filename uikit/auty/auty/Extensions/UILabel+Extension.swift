//
//  UILabel+Extension.swift
//  auty
//
//  Created by Tin on 23/01/2024.
//

import UIKit

extension UILabel {
    func cornerRadius(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
    
    func setupTitle(text: String, fontName: String, size: CGFloat, textColor: UIColor) {
        if let font = UIFont(name: fontName, size: size) {
            self.font = font
        }
        
        self.textAlignment = .center
        self.textColor = textColor
        self.text = text
    }
    
    func setBoldText() {
        if let currentFont = self.font {
            let boldFont = UIFont(descriptor: currentFont.fontDescriptor.withSymbolicTraits(.traitBold)!, size: currentFont.pointSize)
            self.font = boldFont
        }
    }
}
