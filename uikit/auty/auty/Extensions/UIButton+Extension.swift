//
//  UIButton+Extension.swift
//  auty
//
//  Created by Tin on 23/01/2024.
//

import UIKit

extension UIButton {
    func cornerRadius(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
    
    func addBorder(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
    func setTitle(title: String, fontName: String, size: CGFloat, color: UIColor) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(color, for: .normal)
        self.setTitleColor(.darkGray, for: .highlighted)
        
        var configuration = self.configuration ?? UIButton.Configuration.gray()
        configuration.titleTextAttributesTransformer =
        UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont(name: fontName, size: size)
            
            if let descriptor = outgoing.font?.fontDescriptor {
                outgoing.font = UIFont(descriptor: descriptor.withSymbolicTraits(.traitBold)!, size: size)
            }
            
            return outgoing
        }
        
        self.configuration = configuration
    }
    
    func removeBackground() {
        let configuration = UIButton.Configuration.plain()
        self.configuration = configuration
    }
    
    //    func showPasswordButton() {
//        self.setImage(UIImage(systemName: SystemImageNames.eye), for: .normal)
//        self.tintColor = .gray
//    }
}
