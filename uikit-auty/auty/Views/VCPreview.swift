//
//  VCPreview.swift
//  auty
//
//  Created by Tin on 23/01/2024.
//

import SwiftUI

struct VCPreview<T: UIViewController>: UIViewControllerRepresentable {
    
    let viewController: T
    
    init(_ viewControllerBuilder: @escaping () -> T) {
        viewController = viewControllerBuilder()
    }
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
    }
}
