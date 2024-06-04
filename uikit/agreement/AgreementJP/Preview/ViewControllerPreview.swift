//
//  ViewControllerPreview.swift
//  AgreementJP
//
//  Created by Nguyen Trung Tin on 24/11/2023.
//

import SwiftUI
struct ViewControllerPreview<T: UIViewController>: UIViewControllerRepresentable {
    
    let viewController: T
    
    init(_ viewControllerBuilder: @escaping () -> T) {
        viewController = viewControllerBuilder()
    }
    
    func makeUIViewController(context: Context) -> T {
        viewController
    }
    
    func updateUIViewController(_ uiViewController: T, context: Context) { }
}
