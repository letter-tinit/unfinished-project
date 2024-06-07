//
//  UIViewExtension.swift
//  auty
//
//  Created by Tin on 23/01/2024.
//

import UIKit

extension UIView {
    func makeCircular() {
        self.layer.cornerRadius = min(frame.size.width, frame.size.height) / 2.0
        self.clipsToBounds = true
    }
}
