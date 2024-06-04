//
//  PrivacyPolicyViewController.swift
//  AgreementJP
//
//  Created by Nguyen Trung Tin on 25/11/2023.
//

import UIKit
import SwiftUI
import PDFKit

class PrivacyPolicyViewController: UIViewController {
    // -MARK: Create UI
    lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleHeaderLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var policyPDFView: PDFView = {
        let pdfView = PDFView()
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        return pdfView
    }()
    
    lazy var privacyPolicyNextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
        setupAction()
    }
    
    // -MARK: Setup Data
    func setupData() {
        titleHeaderLabel.text = "プライバシーポリシー"
        
        privacyPolicyNextButton.defaultButton()
        privacyPolicyNextButton.setTitle("同意して実行", for: .normal)
    }
    
    // -MARK: Setup UI
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(headerView)
        headerView.addSubview(titleHeaderLabel)
        titleHeaderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(privacyPolicyNextButton)
        view.addSubview(policyPDFView)
        
        headerViewConfigure()
        policyPDFViewConfigure()
        privacyPolicyNextButtonConfigure()
    }
    
    func headerViewConfigure() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func policyPDFViewConfigure() {
        guard let url = Bundle.main.url(forResource: "sample", withExtension: "pdf") else {
            return
        }
        
        guard let document = PDFDocument(url: url) else {
            return
        }
        
        policyPDFView.document = document
        
        NSLayoutConstraint.activate([
            policyPDFView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            policyPDFView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            policyPDFView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            policyPDFView.bottomAnchor.constraint(equalTo: privacyPolicyNextButton.topAnchor, constant: -20),
        ])
    }
    
    func privacyPolicyNextButtonConfigure() {
        NSLayoutConstraint.activate([
            privacyPolicyNextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            privacyPolicyNextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            privacyPolicyNextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            privacyPolicyNextButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    // -MARK: Setup Action
    func setupAction() {
        privacyPolicyNextButton.addTarget(self, action: #selector(privacyPolicyNextButtonTapped), for: .touchUpInside)
    }
    // -MARK: Catch Action
    @objc
    func privacyPolicyNextButtonTapped() {
        if let termViewController = navigationController?.viewControllers.first(where: { $0 is TermViewController }) as? TermViewController {
            termViewController.agreePolicySubject.send(true)
        }
        self.navigationController?.popViewController(animated: true)
    }
}


// -MARK: Preview
struct PrivacyPolicyViewControllerPreview: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            let privacyPolicyViewController = UINavigationController(rootViewController: PrivacyPolicyViewController())
            return privacyPolicyViewController
        }
    }
}

