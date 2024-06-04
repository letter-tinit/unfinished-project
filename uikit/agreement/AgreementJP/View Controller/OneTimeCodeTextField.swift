//
//  OneTimeCodeTextField.swift
//  AgreementJP
//
//  Created by Nguyen Trung Tin on 29/11/2023.
//

//import UIKit
//
//class OneTimeCodeTextField: UITextField {
//    private var isConfigured = false
//    
//    private var digitLabels = [UILabel]()
//    
//    func configure(with slotCount: Int = 6) {
//        guard isConfigured == false else { return }
//        isConfigured.toggle()
//        
//        configureTextField()
//        
//        let labelsStackView = createLabelsStackView(with: slotCount)
//        addSubview(labelsStackView)
//        
//        NSLayoutConstraint.activate([
//            labelsStackView.topAnchor.constraint(equalTo: topAnchor),
//            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            labelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            labelsStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
//        ])
//    }
//    
//    private func configureTextField() {
//        tintColor = .clear
//        textColor = .clear
//        keyboardType = .numberPad
//        textContentType = .oneTimeCode
//    }
//    
//    private func createLabelsStackView(with count: Int) -> UIStackView {
//        let stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .horizontal
//        stackView.alignment = .fill
//        stackView.distribution = .fillEqually
//        stackView.spacing = 6
//        
//        for _ in 1 ... count {
//            let label = UILabel()
//            label.translatesAutoresizingMaskIntoConstraints = false
//            label.textAlignment = .center
//            label.font = .systemFont(ofSize: 40)
//            label.backgroundColor = .blue
//            
//            stackView.addArrangedSubview(label)
//            digitLabels.append(label)
//        }
//        
//        return stackView
//    }
//}
