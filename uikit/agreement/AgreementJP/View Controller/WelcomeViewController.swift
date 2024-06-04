//
//  WelcomeViewController.swift
//  AgreementJP
//
//  Created by Nguyen Trung Tin on 24/11/2023.
//

import UIKit
import SwiftUI

class WelcomeViewController: UIViewController {
    // Create UI
    lazy var welcomeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var welcomeTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var welcomeDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var welcomeNextButton: UIButton = {
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
    
    // -Mark: Setup Data
    func setupData() {
        welcomeImageView.image = UIImage(named: "welcome")
        
        welcomeTitleLabel.text = "こんにちは"
        welcomeTitleLabel.font = .boldSystemFont(ofSize: 30)
        welcomeTitleLabel.textAlignment = .center
        
        welcomeDescriptionLabel.text = "テルモ体温アプリは、体温計と連携して日々の体温管理を簡単に行うためのアプリです。\nご利用にあたって、「利用規約」と「プライバシーポリシー」への同意をお願いします。"
        welcomeDescriptionLabel.font = .systemFont(ofSize: 14)
        welcomeDescriptionLabel.textAlignment = .left
        welcomeDescriptionLabel.lineBreakMode = .byCharWrapping
        welcomeDescriptionLabel.numberOfLines = 0
        
        welcomeNextButton.defaultButton()
        welcomeNextButton.setTitle("次へ", for: .normal)
    }
    
    // -Mark: Setup UI
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(welcomeImageView)
        welcomeImageViewConfig()
        
        view.addSubview(welcomeTitleLabel)
        welcomeTitleLabelConfig()
        
        view.addSubview(welcomeDescriptionLabel)
        welcomeDescriptionLabelConfig()
        
        view.addSubview(welcomeNextButton)
        welcomeNextButtonConfig()
    }
    
    func welcomeImageViewConfig() {
        NSLayoutConstraint.activate([
            welcomeImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            welcomeImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            welcomeImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    func welcomeTitleLabelConfig() {
        NSLayoutConstraint.activate([
            welcomeTitleLabel.topAnchor.constraint(equalTo: welcomeImageView.bottomAnchor, constant: 30),
            welcomeTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            welcomeTitleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    func welcomeDescriptionLabelConfig() {
        NSLayoutConstraint.activate([
            welcomeDescriptionLabel.topAnchor.constraint(equalTo: welcomeTitleLabel.bottomAnchor, constant: 20),
            welcomeDescriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            welcomeDescriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    func welcomeNextButtonConfig() {
        NSLayoutConstraint.activate([
            welcomeNextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            welcomeNextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            welcomeNextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            welcomeNextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    // -Mark: Setup Action
    func setupAction() {
        welcomeNextButton.addTarget(self, action: #selector(welcomeNextButtonTapped), for: .touchUpInside)
    }
    
    // -Mark: Catch Action
    @objc
    func welcomeNextButtonTapped() {
        let termViewController = TermViewController()
        navigationController?.pushViewController(termViewController, animated: true)
    }
}

// -MARK: Preview
struct WelcomeViewControllerPreview: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            let welcomeViewController = UINavigationController(rootViewController: WelcomeViewController())
            return welcomeViewController
        }
    }
}

