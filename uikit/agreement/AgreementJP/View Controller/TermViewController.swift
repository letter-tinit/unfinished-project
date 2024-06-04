//
//  TermViewController.swift
//  AgreementJP
//
//  Created by Nguyen Trung Tin on 24/11/2023.
//

import UIKit
import SwiftUI
import Combine

class TermViewController: UIViewController {
    // -MARK: Variable
    var agreeTermOfUseSubject = PassthroughSubject<Bool, Never>()
    var agreePolicySubject = PassthroughSubject<Bool, Never>()
    var permissionSubject = PassthroughSubject<Bool, Never>()
    var permissionStatus: Bool = false
    var cancellables: Set<AnyCancellable>  = []
    
    var combinedSubjects: AnyPublisher<Bool, Never> {
        return Publishers.CombineLatest(agreeTermOfUseSubject, agreePolicySubject)
            .map { $0 && $1 }
            .eraseToAnyPublisher()
    }
    
    // -MARK: Create UI
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isDirectionalLockEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 40
        stackView.distribution = .equalSpacing
        stackView.contentMode = .scaleAspectFit
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var termTitleLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byCharWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var actionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var termActionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var policyActionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var termRatioStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var termRatioButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var termRatioLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byCharWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var policyRatioStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var policyRatioButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var policyRatioLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byCharWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var permissionRatioStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .top
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var permissionRatioButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var permissionRatioContentStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var permissionRatioLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byCharWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var permissionRatioDescriptionLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byCharWrapping
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var startJPButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
        setupAction()
        ratioObserve()
    }
    
    // -MARK: Setup Data
    func setupData() {
        termTitleLabel.text = "利用規約とプライバシーポリシーをご確認いただき、同意をお願いします。"
        
        termActionButton.setTitle("利用規約", for: .normal)
        policyActionButton.setTitle("プライバシーポリシー", for: .normal)
        
        termRatioLabel.text = "利用規約に同意します。"
        
        policyRatioLabel.text = "プライバシーポリシーに同意します。"
        
        permissionRatioLabel.text = "将来の研究開発等の目的で私のデータが利用されることに同意します。"
        permissionRatioDescriptionLabel.text = "・データは個人が特定できない形で利用されます。\n・いつでも自由にこの同意を撤回できます。\n・詳細は、利用規約およびプライバシーポリシーの記載をご覧ください。"
        
        startJPButton.defaultButton()
        startJPButton.setTitle("開始", for: .normal)
    }
    
    // -MARK: Setup UI
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        navigationBarConfigure()
        
        view.addSubview(termTitleLabel)
        view.addSubview(scrollView)
        view.addSubview(startJPButton)
        
        startJPButtonConfigure()
        scrollViewConfigure()
        termTitleLabelConfigure()
    }
    
    func navigationBarConfigure() {
        navigationController?.navigationBar.tintColor = UIColor(named: "navigationBar")
    }
    
    func termTitleLabelConfigure() {
        NSLayoutConstraint.activate([
            termTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            termTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            termTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        ])
    }
    
    func scrollViewConfigure() {
        scrollView.addSubview(stackView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: termTitleLabel.bottomAnchor, constant: 30),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: startJPButton.safeAreaLayoutGuide.topAnchor, constant: -20)
        ])
        stackViewConfigure()
    }
    
    func stackViewConfigure() {
        stackView.addArrangedSubview(actionStackView)
        actionStackViewConfigure()
        
        stackView.addArrangedSubview(termRatioStack)
        termRatioStackConfigure()
        
        stackView.addArrangedSubview(policyRatioStack)
        policyRatioStackConfigure()
        
        stackView.addArrangedSubview(permissionRatioStack)
        permissionRatioStackConfigure()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            stackView.leftAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leftAnchor, constant: 25),
            stackView.rightAnchor.constraint(equalTo: scrollView.contentLayoutGuide.rightAnchor, constant: -25),
            stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
    }
    
    func actionStackViewConfigure() {
        actionStackView.addArrangedSubview(termActionButton)
        actionStackView.addArrangedSubview(policyActionButton)
        termActionButton.linkButton()
        policyActionButton.linkButton()
    }
    
    func termRatioStackConfigure() {
        termRatioStack.addArrangedSubview(termRatioButton)
        termRatioButton.ratioButton()
        
        termRatioStack.addArrangedSubview(termRatioLabel)
    }
    
    func policyRatioStackConfigure() {
        policyRatioStack.addArrangedSubview(policyRatioButton)
        policyRatioButton.ratioButton()
        
        policyRatioStack.addArrangedSubview(policyRatioLabel)
    }
    
    func permissionRatioStackConfigure() {
        permissionRatioStack.addArrangedSubview(permissionRatioButton)
        permissionRatioButton.ratioButton()
        
        permissionRatioStack.addArrangedSubview(permissionRatioContentStack)
        permissionRatioContentStack.addArrangedSubview(permissionRatioLabel)
        permissionRatioContentStack.addArrangedSubview(permissionRatioDescriptionLabel)
        permissionRatioDescriptionLabel.textColor = .systemGray
    }
    
    func startJPButtonConfigure() {
        startJPButton.isEnabled = false
        NSLayoutConstraint.activate([
            startJPButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            startJPButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            startJPButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            startJPButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    // -MARK: Setup Action
    func setupAction() {
        termActionButton.addTarget(self, action: #selector(termActionButtonTapped), for: .touchUpInside)
        policyActionButton.addTarget(self, action: #selector(policyActionButtonTapped), for: .touchUpInside)
        permissionRatioButton.addTarget(self, action: #selector(permissionRatioButtonTapped), for: .touchUpInside)
    }
    
    // -MARK: Catch Action
    @objc
    func termActionButtonTapped() {
        let termOfUseViewController = TermOfUseViewController()
        self.navigationController?.pushViewController(termOfUseViewController, animated: true)
    }
    
    @objc
    func policyActionButtonTapped() {
        let privacyPolicyViewController = PrivacyPolicyViewController()
        self.navigationController?.pushViewController(privacyPolicyViewController, animated: true)
    }
    
    
    @objc
    func permissionRatioButtonTapped() {
        if permissionStatus {
            permissionStatus = false
            self.permissionSubject.send(false)
        } else {
            permissionStatus = true
            self.permissionSubject.send(true)
        }
    }
    
    // -MARK: Observe Congigure
    func ratioObserve() {
        agreeTermOfUseSubject
            .sink { [weak self] isChecked in
                let imageName = isChecked ? "checkmark.circle.fill" : "circle"
                self?.termRatioButton.ratioButton(imageName: imageName)
            }
            .store(in: &cancellables)
        
        agreePolicySubject
            .sink { [weak self] isChecked in
                let imageName = isChecked ? "checkmark.circle.fill" : "circle"
                self?.policyRatioButton.ratioButton(imageName: imageName)
            }
            .store(in: &cancellables)
        
        combinedSubjects
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isCombinedTrue in
                self?.startJPButton.isEnabled = isCombinedTrue
            }
            .store(in: &cancellables)
        
        permissionSubject
            .sink { [weak self] isChecked in
                let imageName = isChecked ? "checkmark.circle.fill" : "circle"
                self?.permissionRatioButton.ratioButton(imageName: imageName)
            }
            .store(in: &cancellables)
    }
}

// -MARK: Preview
struct TermViewControllerPreview: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            let termViewController = UINavigationController(rootViewController: TermViewController())
            return termViewController
        }
    }
}

