//
//  TermOfUseOfUseViewController.swift
//  AgreementJP
//
//  Created by Nguyen Trung Tin on 25/11/2023.
//

import UIKit
import SwiftUI
import PDFKit

class TermOfUseViewController: UIViewController {
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
    
    lazy var termOfUsePDFView: PDFView = {
        let pdfView = PDFView()
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        return pdfView
    }()
    
    lazy var termOfUseNextButton: UIButton = {
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
        titleHeaderLabel.text = "利用規約"
        
        termOfUseNextButton.defaultButton()
        termOfUseNextButton.setTitle("同意して実行", for: .normal)
    }
    
    // -MARK: Setup UI
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(headerView)
        headerView.addSubview(titleHeaderLabel)
        titleHeaderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(termOfUseNextButton)
        view.addSubview(termOfUsePDFView)
        
        headerViewConfigure()
        termOfUsePDFViewConfigure()
        termOfUseNextButtonConfigure()
    }
    
    func headerViewConfigure() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func termOfUsePDFViewConfigure() {
        guard let url = Bundle.main.url(forResource: "sample", withExtension: "pdf") else {
            return
        }
        
        guard let document = PDFDocument(url: url) else {
            return
        }
        
        termOfUsePDFView.document = document
        
        NSLayoutConstraint.activate([
            termOfUsePDFView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            termOfUsePDFView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            termOfUsePDFView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            termOfUsePDFView.bottomAnchor.constraint(equalTo: termOfUseNextButton.topAnchor, constant: -20),
        ])
    }
    
    func termOfUseNextButtonConfigure() {
        NSLayoutConstraint.activate([
            termOfUseNextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            termOfUseNextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            termOfUseNextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            termOfUseNextButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    // -MARK: Setup Action
    func setupAction() {
        termOfUseNextButton.addTarget(self, action: #selector(termOfUseNextButtonTapped), for: .touchUpInside)
    }
    
    // -MARK: Catch Action
    @objc
    func termOfUseNextButtonTapped() {
        if let termViewController = navigationController?.viewControllers.first(where: { $0 is TermViewController }) as? TermViewController {
            termViewController.agreeTermOfUseSubject.send(true)
        }
        self.navigationController?.popViewController(animated: true)
    }
}

// -MARK: Preview
struct TermOfUseViewControllerPreview: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            let termOfUseViewController = UINavigationController(rootViewController: TermOfUseViewController())
            return termOfUseViewController
        }
    }
}
