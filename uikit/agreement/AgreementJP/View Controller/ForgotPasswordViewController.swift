//
//  ForgotPasswordViewController.swift
//  AgreementJP
//
//  Created by Nguyen Trung Tin on 27/11/2023.
//

import UIKit
import SwiftUI

class ForgotPasswordViewController: UIViewController {
    
    // -MARK: Create UI
    lazy var topDividerView = UIView()
    
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
        stackView.spacing = 20
        stackView.contentMode = .scaleToFill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var guideLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byCharWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var registeredAccountContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var registeredAccountStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var registeredAccountLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byCharWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var registeredAccountTextFieldStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var registeredAccountTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var registeredAccountDividerView = UIView()
    
    lazy var otpContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var otpStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var otpTitle: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byCharWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var otpTextFieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .equalSpacing
        stackView.contentMode = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var otpTextFieldContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var otpTextField: OneTimeCodeTextField = {
        let textField = OneTimeCodeTextField()
        return textField
    }()
    
    lazy var otpDividerView = UIView()
    
    lazy var resendOTPButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var verifyRequired: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byCharWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }
    
    // -MARK: Setup Data
    func setupData() {
        self.title = "パスワード変更"
        self.guideLabel.text = "ご登録いただいたメールアドレス宛に認証コードを送信しました。\n届いたメールに記載された認証コードと新しいパスワードを入力してください。"
        self.guideLabel.font = UIFont.systemFont(ofSize: 14)
        
        self.registeredAccountLabel.text = "登録されたメールアドレス"
        self.registeredAccountLabel.font = UIFont.systemFont(ofSize: 14)
        self.registeredAccountTextField.text = "tinit4ever@terumo.co.jp"
        self.registeredAccountTextField.font = UIFont.systemFont(ofSize: 14)
        
        self.otpTitle.text = "認証コード"
        self.otpTitle.font = UIFont.systemFont(ofSize: 14)
        //        self.otpTextField.text = "9"
        
        self.resendOTPButton.linkButton(with: "otpColor")
        self.resendOTPButton.setTitle("認証コードを再送する", for: .normal)
        
        self.verifyRequired.text = "「@mail.taionapps-terumo.com」からのメールを受信できるよう設定をお願いします。"
        self.verifyRequired.font = UIFont.systemFont(ofSize: 14)
    }
    
    // -MARK: Setup UI
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(topDividerView)
        view.addSubview(scrollView)
        
        topDividerView.divider()
        NSLayoutConstraint.activate([
            topDividerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topDividerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topDividerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        scrollViewConfigure()
    }
    
    func scrollViewConfigure() {
        scrollView.addSubview(stackView)
        stackViewConfigure()
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topDividerView.bottomAnchor, constant: 30),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func stackViewConfigure() {
        stackView.addArrangedSubview(guideLabel)
        
        stackView.addArrangedSubview(registeredAccountContainerView)
        registeredAccountContainerViewConfigure()
        
        stackView.addArrangedSubview(otpContainerView)
        otpContainerViewConfigure()
        
        stackView.addArrangedSubview(resendOTPButton)
        resendOTPButton.contentHorizontalAlignment = .right
        
        stackView.addArrangedSubview(verifyRequired)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
        ])
    }
    
    func registeredAccountContainerViewConfigure() {
        registeredAccountContainerView.addSubview(registeredAccountStackView)
        
        registeredAccountStackView.addArrangedSubview(registeredAccountLabel)
        registeredAccountStackView.addArrangedSubview(registeredAccountTextFieldStackView)
        
        registeredAccountTextFieldStackView.addArrangedSubview(registeredAccountTextField)
        registeredAccountTextFieldStackView.addArrangedSubview(registeredAccountDividerView)
        registeredAccountDividerView.divider()
        
        NSLayoutConstraint.activate([
            registeredAccountStackView.topAnchor.constraint(equalTo: registeredAccountContainerView.topAnchor),
            registeredAccountStackView.leadingAnchor.constraint(equalTo: registeredAccountContainerView.leadingAnchor, constant: 20),
            registeredAccountStackView.trailingAnchor.constraint(equalTo: registeredAccountContainerView.trailingAnchor, constant: -20),
            registeredAccountStackView.bottomAnchor.constraint(equalTo: registeredAccountContainerView.bottomAnchor),
        ])
    }
    
    func otpContainerViewConfigure() {
        otpContainerView.addSubview(otpStackView)
        otpStackView.addArrangedSubview(otpTitle)
        otpStackView.addArrangedSubview(otpTextFieldStackView)
        
//        otpTextFieldStackView.addArrangedSubview(otpTextFieldContainerView)
//        otpTextFieldContainerView.addSubview(otpTextField)
        otpTextFieldStackView.addArrangedSubview(otpTextField)
        otpTextField.configure()
        
        otpTextFieldStackView.addArrangedSubview(otpDividerView)
        otpDividerView.divider()
        
        NSLayoutConstraint.activate([
//            otpTextField.topAnchor.constraint(equalTo: otpTextFieldContainerView.topAnchor),
//            otpTextField.leadingAnchor.constraint(equalTo: otpTextFieldContainerView.leadingAnchor, constant: 20),
//            otpTextField.trailingAnchor.constraint(equalTo: otpTextFieldContainerView.trailingAnchor, constant: -20),
//            otpTextField.bottomAnchor.constraint(equalTo: otpTextFieldContainerView.bottomAnchor),
//            otpTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            otpTextField.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
//            otpTextField.topAnchor.constraint(equalTo: otpStackView.topAnchor),
//            otpTextField.leadingAnchor.constraint(equalTo: otpStackView.leadingAnchor, constant: 20),
//            otpTextField.trailingAnchor.constraint(equalTo: otpStackView.trailingAnchor, constant: -20),
//            otpTextField.bottomAnchor.constraint(equalTo: otpStackView.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            otpStackView.topAnchor.constraint(equalTo: otpContainerView.topAnchor),
            otpStackView.leadingAnchor.constraint(equalTo: otpContainerView.leadingAnchor, constant: 20),
            otpStackView.trailingAnchor.constraint(equalTo: otpContainerView.trailingAnchor, constant: -20),
            otpStackView.bottomAnchor.constraint(equalTo: otpContainerView.bottomAnchor),
        ])
        
    }
}

// -MARK: Preview
struct ForgotPasswordControllerPreview: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            let forgotPasswordViewController = UINavigationController(rootViewController: ForgotPasswordViewController())
            return forgotPasswordViewController
        }
    }
}

class OneTimeCodeTextField: UITextField {
    
    var didEnterLastDigit: ((String) -> Void)?
    
    var defaultCharacter = "-"
    
    private var isConfigured = false
    
    private var digitLabels = [UILabel]()
    
    private lazy var tapRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(becomeFirstResponder))
        return recognizer
    }()
    
    func configure(with slotCount: Int = 6) {
        guard isConfigured == false else { return }
        isConfigured.toggle()
        
        configureTextField()
        
        let labelsStackView = createLabelsStackView(with: slotCount)
        
        addSubview(labelsStackView)
        
        addGestureRecognizer(tapRecognizer)
        
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: topAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            labelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            labelsStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func configureTextField() {
        tintColor = .clear
        textColor = .clear
        keyboardType = .numberPad
        textContentType = .oneTimeCode
        
        addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    private func createLabelsStackView(with count: Int) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        
        for _ in 1 ... count {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.font = .boldSystemFont(ofSize: 25)
            label.textColor = UIColor(named: "otpColor")
            label.backgroundColor = .clear
            label.isUserInteractionEnabled = true
            label.text = defaultCharacter
            
            stackView.addArrangedSubview(label)
            digitLabels.append(label)
        }
        
        return stackView
    }
    
    @objc
    private func textDidChange() {
        guard let text = self.text, text.count <= digitLabels.count else { return }
        
        for i in 0 ..< digitLabels.count {
            let currentLabel = digitLabels[i]
            
            if i < text.count {
                let index = text.index(text.startIndex, offsetBy: i)
                currentLabel.text = String(text[index])
            } else {
                currentLabel.text = defaultCharacter
            }
        }
        
        if text.count == digitLabels.count {
            didEnterLastDigit?(text)
        }
    }
}

extension OneTimeCodeTextField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let characterCount = textField.text?.count else { return false }
        return characterCount < digitLabels.count || string == ""
    }
}
