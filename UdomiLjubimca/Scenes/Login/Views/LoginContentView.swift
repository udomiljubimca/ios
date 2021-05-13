//
//  LoginContentView.swift
//  UdomiLjubimca
//
//  Created by Dejan Zuza on 13. 5. 2021..
//

import UIKit
import SnapKit

class LoginContentView: UIView {
    private lazy var emailTextField: UITextField = {
        let textField = UITextField().autoLayoutView()
        textField.backgroundColor = .yellow
        textField.placeholder = "Username or email"
        textField.layer.cornerRadius = 5
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField().autoLayoutView()
        textField.backgroundColor = .blue
        textField.placeholder = "Password"
        textField.layer.cornerRadius = 10
        return textField
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton().autoLayoutView()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .red
        return button
    }()

    private lazy var privacyAgreementLabel: UILabel = {
        let label = UILabel().autoLayoutView()
        label.text = "This is not real version"
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private Methods
private extension LoginContentView {
    func setupViews() {
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(privacyAgreementLabel)
        setupConstraints()
    }

    func setupConstraints() {
        privacyAgreementLabel.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview().inset(16)
        }

        loginButton.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.width.equalTo(200)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(privacyAgreementLabel.snp.top).offset(-8)
        }

        passwordTextField.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.width.equalTo(200)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(loginButton.snp.top).offset(-24)
        }

        emailTextField.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.width.equalTo(200)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(passwordTextField.snp.top).offset(-8)
        }
    }
}
