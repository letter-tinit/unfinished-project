//
//  GradientProgressView.swift
//  auty
//
//  Created by Tin on 23/01/2024.
//

import UIKit

class GradientProgressView: UIProgressView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemOrange.cgColor]
        layer.addSublayer(gradient)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
