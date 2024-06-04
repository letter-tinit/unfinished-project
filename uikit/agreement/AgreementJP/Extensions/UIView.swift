//
//  UIView.swift
//  AgreementJP
//
//  Created by Nguyen Trung Tin on 27/11/2023.
//

import UIKit

extension UIView {
    func divider() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .systemGray5
        self.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}
