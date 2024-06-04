//
//  UIButton.swift
//  AgreementJP
//
//  Created by Nguyen Trung Tin on 24/11/2023.
//
import UIKit

extension UIButton {
    func defaultButton() {
        self.backgroundColor = UIColor(named: "buttonBackground")
        self.tintColor = .white
        
        var configuration = UIButton.Configuration.plain()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        self.configuration = configuration
        self.layer.cornerRadius = 20
    }
    
    func linkButton(with buttonColor: String) {
        var configuration = UIButton.Configuration.plain()
        configuration.baseForegroundColor = UIColor(named: buttonColor)
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        self.configuration = configuration
    }
    
    func linkButton() {
        var configuration = UIButton.Configuration.plain()
        configuration.baseForegroundColor = UIColor(named: "button")
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        self.configuration = configuration
    }
    
    func ratioButton() {
        self.widthAnchor.constraint(equalToConstant: 20).isActive = true
        self.heightAnchor.constraint(equalToConstant: 20).isActive = true
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: "circle")
        configuration.buttonSize = .large
        configuration.imagePadding = 0
        configuration.baseForegroundColor = .systemGray4
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        self.configuration = configuration
    }
    
    func ratioButton(imageName: String) {
        self.widthAnchor.constraint(equalToConstant: 20).isActive = true
        self.heightAnchor.constraint(equalToConstant: 20).isActive = true
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: imageName)
        configuration.baseForegroundColor = UIColor(named: "buttonBackground")
        configuration.buttonSize = .large
        configuration.imagePadding = 0
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        self.configuration = configuration
    }
}
