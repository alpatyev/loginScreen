//
//  LoginViewController.swift
//  loginScreen
//
//  Created by Nikita Alpatiev on 12/21/22.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    // MARK: - Lifecycle
        
    private lazy var loginView: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.layer.cornerRadius = 30
        textField.leftView = viewWithAttachedImage(withSize: CGSize(width: 60, height: 30),
                                                   scale: 0.8,
                                                   imageNamed: "person.png")
        textField.leftViewMode = .always
        textField.rightView = viewWithAttachedImage(withSize: CGSize(width: 60,
                                                                     height: 30),
                                                    scale: 0.8,
                                                    imageNamed: "check.png")
        textField.rightViewMode = .unlessEditing
        return textField
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - Setups
    
    private func setupView() {
        view.backgroundColor = .darkGray
    }
    
    private func setupHierarchy() {
        view.addSubview(loginView)
    }
    
    private func setupLayout() {
        loginView.snp.makeConstraints { make in
            make.centerY.equalTo(view)
            make.centerX.equalTo(view)
            make.width.equalTo(view).multipliedBy(0.8)
            make.height.equalTo(60)
        }
    }
    
    // MARK: - Actions
}

