//
//  LoginViewController.swift
//  UdomiLjubimca
//
//  Created by Dejan Zuza on 13. 5. 2021..
//

import UIKit

protocol LoginDisplayLogic {
    func displayAlert(title: String, message: String)
}

class LoginViewController: UIViewController {
    private lazy var contentView = LoginContentView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    override func loadView() {
        view = contentView
    }
}

// MARK: Private Methods
private extension LoginViewController {
    func setupViews() {
    }
}


// MARK: LoginDisplayLogic
extension LoginViewController: LoginDisplayLogic {
    func displayAlert(title: String, message: String) {}
}
