//
//  UIImage+Extension.swift
//  auty
//
//  Created by Tin on 23/01/2024.
//

import UIKit

extension UIImage {
    func resized(to size: CGFloat) -> UIImage {
        let cgSize = CGSize(width: size, height: size)
        return UIGraphicsImageRenderer(size: cgSize).image { _ in
            draw(in: CGRect(origin: .zero, size: cgSize))
        }
    }
    
    static func gradientImage(with bounds: CGRect,
                              colors: [CGColor],
                              locations: [NSNumber]?) -> UIImage? {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0.0,
                                           y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0,
                                         y: 0.5)
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return image
    }
}


